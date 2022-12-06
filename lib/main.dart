import 'package:flutter/material.dart';
import 'package:pickapp/globals.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final accessToken = Provider.of<TokenProvider>(context).token;

    Future<dynamic> getToken() async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // return prefs.getString('x-auth-token');
    }

    return FutureBuilder<dynamic>(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint("abbas ${snapshot.data} ");
          isLoggedIn = snapshot.data != "";
        }

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
