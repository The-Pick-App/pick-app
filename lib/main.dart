import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pickapp/providers/token_provider.dart';
import 'package:pickapp/providers/user_provider.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => UserProvider())),
        ChangeNotifierProvider(create: ((_) => TokenProvider()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accessToken = Provider.of<TokenProvider>(context).token;

    Future<dynamic> abbas() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      return prefs.getString('x-auth-token');
    }

    return FutureBuilder<dynamic>(
      future: abbas(),
      builder: (context, snapshot) {
        debugPrint("abbas ${accessToken.toJson()} ");
        var isLoggedIn = snapshot.hasData;

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
      },
    );
  }
}
