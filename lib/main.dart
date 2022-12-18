import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickapp/app/modules/splash/splash_screen.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            return GetMaterialApp.router(
              title: 'Pick App',
              debugShowCheckedModeBanner: false,
              theme: Pallete.lightModeAppTheme,
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) => routes,
              ),
              routeInformationParser: const RoutemasterParser(),
            );
          }
        }
      },
    );
  }

  Future<void> initializeSettings(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 0));
  }
}
