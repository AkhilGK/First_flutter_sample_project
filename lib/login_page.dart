// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_hub/home_page.dart';
import 'package:game_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool isempty = true;
  final keyval = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Hub'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            child: Form(
              key: keyval,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Your Username',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                    width: double.infinity,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      icon: Icon(Icons.safety_check_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                    width: double.infinity,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (keyval.currentState!.validate()) {
                        checklogin(context);
                      }
                    },
                    icon: Icon(Icons.check),
                    label: (Text('Log in')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    String uname = 'admin';
    String pword = 'password';

    if (_username == uname || _password == pword) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(Saved_Key_state, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
      // (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          backgroundColor: Colors.red,
          content: Text('User name password doesnot match!')));
    }
  }
}
