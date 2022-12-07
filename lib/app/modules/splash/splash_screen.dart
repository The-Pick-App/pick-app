import 'package:flutter/material.dart';
import 'package:pickapp/app/modules/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initializeSettings(BuildContext context) async {
    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Routemaster.of(context).push("/");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return const Scaffold(
              backgroundColor: Colors.red,
              body: Center(child: Text("fuck")),
            );
          } else {
            return Text("data");
          }
        }
      },
    );
  }
}
