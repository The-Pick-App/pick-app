import 'package:flutter/material.dart';
import 'package:pickapp/providers/token_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = Provider.of<TokenProvider>(context).token;

    return Scaffold(
      appBar: AppBar(
        title: Text(accessToken.toString()),
      ),
    );
  }
}
