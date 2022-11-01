import 'package:flutter/material.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoggedIn = true;

    return MaterialApp.router(
      title: 'Pick App',
      debugShowCheckedModeBanner: false,
      theme: Pallete.darkModeAppTheme,
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          // ignore: dead_code
          if (isLoggedIn) {
            return loggedInRoute;
          }
          // ignore: dead_code
          return loggedOutRoute;
        },
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
