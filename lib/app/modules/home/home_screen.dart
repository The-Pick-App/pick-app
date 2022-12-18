import 'package:flutter/material.dart';
import 'package:pickapp/app/widgets/buttom_bar.dart';
import 'package:pickapp/services/auth.services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (() {
              authService.logout(context: context);
            }),
            child: const Text("Logout")),
      ),
      bottomNavigationBar: const ButtomBar(),
    );
  }
}
