import 'package:flutter/material.dart';

import 'home_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          // leading: Icon(Icons.menu),
          title: Text('Login Screen', style: TextStyle(color: Colors.white)),
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
    return Container(
      height: 150.0,
      width: 190.0,
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      child: const Center(
        child: FlutterLogo(size: 100,),
      ),
    );
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
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
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
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextButton(
        onPressed: () {
          String messagenotif = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              isLoginSuccess = true;
              messagenotif = 'Login Success';
            });
          } else {
            setState(() {
              isLoginSuccess = false;
              messagenotif = 'Login Failed';
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(messagenotif),
            duration: Duration(seconds: 3),
          ));

          if (isLoginSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return home_page(messagepackage: 'Welcome $username');
              }));
          }
        },
        child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
    );
  }

  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(onPressed: (){}, child: Text('Register'))
      ],
    );
  }

  Widget _formContainer(context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          _usernametextField(),

          SizedBox(height: 20,),

          _passwordtextField(),
          
          SizedBox(height: 20,),

          _loginButton(context),

          SizedBox(height: 20,),
          
          _registerButton(),
        ],
      ),
    );
  }
}