import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_hub/home_page.dart';
import 'package:game_hub/login_page.dart';
import 'package:game_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Image.asset(
          'assets/images/splash.jpg',
          height: 800,
          width: 500,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(
      MaterialPageRoute(builder: ((context) => ScreenLogin())),
    );
  }

  Future<void> checkLogin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _UserLoggedIn = _sharedPrefs.getBool(Saved_Key_state);
    if (_UserLoggedIn == null || _UserLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx1) {
          return HomePage();
        },
      ));
    }
  }
//
}
