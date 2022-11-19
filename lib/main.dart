import 'package:flutter/material.dart';
import 'package:pickapp/providers/user_provider.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => UserProvider())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoggedIn = false;

    return MaterialApp.router(
      title: 'Pick App',
      debugShowCheckedModeBanner: false,
      theme: Pallete.lightModeAppTheme,
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
