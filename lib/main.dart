import 'package:flutter/material.dart';
import 'package:game_hub/screensplash.dart';

const Saved_Key_state = 'State Login';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameHub',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: ScreenSplash(),
    );
  }
}
