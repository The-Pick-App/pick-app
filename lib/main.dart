import 'package:flutter/material.dart';
import 'package:pickapp/features/auth/screens/login_screen.dart';
import 'package:pickapp/theme/palette/pallette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick App',
      debugShowCheckedModeBanner: false,
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
