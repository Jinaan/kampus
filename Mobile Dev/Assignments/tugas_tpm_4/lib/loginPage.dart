// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tesat1/theme/themeProvider.dart';
import 'package:tesat1/API/API.dart';
import 'dart:convert';

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = false;

  List accounts = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // leading: Icon(Icons.menu),
        title:
            const Text('Login Screen', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: const Icon(Icons.sunny),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _flutterLogo(),
          _formContainer(context),
        ],
      ),
    ));
  }

  Widget _flutterLogo() {
    return const FlutterLogo(size: 100);
  }

  Widget _usernametextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Enter your username',
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }

  Widget _passwordtextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }

  Widget _loginButton(context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () async {
          String messagenotif = '';
          try {
            final response = await http.get(Uri.parse(
                '$API_URL/login?username=$username&password=$password'));
            if (response.statusCode == 200) {
              print('Login Success');
              messagenotif = 'Login Success';
              isLoginSuccess = true;
            } else {
              print('Login Failed');
              messagenotif = 'Login Failed';
              isLoginSuccess = false;
            }
          } catch (e) {
            print(e);
          }

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(messagenotif),
            duration: const Duration(seconds: 3),
          ));

          if (isLoginSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _formContainer(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          _usernametextField(),
          const SizedBox(
            height: 20,
          ),
          _passwordtextField(),
          const SizedBox(
            height: 20,
          ),
          _loginButton(context),
        ],
      ),
    );
  }
}
