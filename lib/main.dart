import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickapp/app/modules/splash/splash_screen.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'Pick App',
    debugShowCheckedModeBanner: false,
    theme: Pallete.lightModeAppTheme,
    home: const SplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final getStorge = GetStorage();
  var routes = loggedOutRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Pick App',
      debugShowCheckedModeBanner: false,
      theme: Pallete.lightModeAppTheme,
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          getStorge.listenKey('accessToken', (accessToken) {
            debugPrint('abbas:  $accessToken');

            if (getStorge.read("accessToken") != null &&
                getStorge.read("accessToken") != "") {
              setState(() {
                routes = loggedInRoute;
              });
            } else {
              setState(() {
                routes = loggedOutRoute;
              });
            }
          });

          return routes;
        },
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
