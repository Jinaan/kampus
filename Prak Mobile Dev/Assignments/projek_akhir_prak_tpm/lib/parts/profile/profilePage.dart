import 'package:flutter/material.dart';
import '../theme/themeProvider.dart';
import '../theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginReg/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;
  String? email;
  String? password;

  bool passwordChanged = false;
  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPrefsSettings();
    _loadEmailNPwd();
  }

  Future<void> _loadEmailNPwd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? 'No Email Saved';
      password = prefs.getString('password') ?? 'No Password Saved';
      emailController.text = email ?? '';
      passwordController.text = password ?? '';
    });
  }

  Future<void> _saveChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (passwordChanged) {
      await prefs.setString('password', passwordController.text);
      password = passwordController.text;
    }
    setState(() {
      passwordChanged = false;
    });

    final Box userBox = await Hive.openBox('users');
    final List<dynamic>? userData = userBox.get(email);
    if (userData != null && userData.isNotEmpty) {
      userBox.put(email, [password, isDarkMode ? 'T' : 'F']);
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastEmail', emailController.text);

    prefs.remove('email');
    prefs.remove('password');

    Provider.of<ThemeProvider>(context, listen: false).setThemeData(lightMode);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Future<void> _savePrefsSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);

    final Box userBox = await Hive.openBox('users');
    final List<dynamic>? userData = userBox.get(email);
    if (userData != null && userData.isNotEmpty) {
      userBox.put(email, [password, isDarkMode ? 'T' : 'F']);
    }
  }

  Future<void> _loadPrefsSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      if (isDarkMode) {
        Provider.of<ThemeProvider>(context, listen: false)
            .setThemeData(darkMode);
      } else {
        Provider.of<ThemeProvider>(context, listen: false)
            .setThemeData(lightMode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  passwordChanged = value.isNotEmpty && value != password;
                });
              },
            ),
            SizedBox(height: 20),
            if (passwordChanged)
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Dark Mode'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      if (isDarkMode) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setThemeData(darkMode);
                      } else {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setThemeData(lightMode);
                      }
                      _savePrefsSettings();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
