import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_hub/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Unlimited Gaming'),
        ),
        body: Container(
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 20),
                  child: Text(
                    'Gaming World',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple[600],
                        shadows: const [
                          Shadow(
                            color: Colors.purple,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ]),
                  ),
                ),
                Image.asset(
                  'assets/images/game1.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 95, bottom: 20),
                  child: Text('Online Games',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple[600],
                          shadows: const [
                            Shadow(
                              color: Colors.purple,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ])),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/gamer1.jpg'),
                  radius: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, bottom: 20, top: 15),
                  child: Text('Multiplayer Games',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple[600],
                          shadows: const [
                            Shadow(
                              color: Colors.purple,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ])),
                ),
                Image.asset('assets/images/game2.jpg'),
                Padding(
                  padding: const EdgeInsets.only(left: 95, bottom: 15),
                  child: Text('Action Games',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple[600],
                          shadows: const [
                            Shadow(
                              color: Colors.purple,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ])),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/gamer2.jpg'),
                  radius: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 94, top: 15),
                  child: Text('Gaming Pro',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple[600],
                          shadows: const [
                            Shadow(
                              color: Colors.purple,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ])),
                ),
                Image.asset('assets/images/game3.jpg'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Sign Out'),
                            content: const Text('You sure to signout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => signout(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                        // child: const Text('Show Dialog'),
                      },
                      child: Text('Sign Out')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.pushAndRemoveUntil(
        ctx,
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (Route<dynamic> route) => false);
  }
}
