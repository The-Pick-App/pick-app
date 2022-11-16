import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeWidget(),
    );
  }
}

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(children: <Widget>[
                  Image.asset('assets/images/background.png',
                      fit: BoxFit.contain),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100.0),
                        child: Container(
                          height: 1.0,
                          width: 60.0,
                          color: const Color.fromARGB(255, 153, 153, 153),
                        ),
                      ),
                      Image.asset('assets/images/logo.png',
                          fit: BoxFit.contain, width: 100.0, height: 100.0),
                      const Center(
                        child: Text(
                          'PICK APP',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ]),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {},
                        child: const Text('Giriş Yap'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {},
                        child: const Text('Kayıt Ol'),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 60.0,
                        color: const Color.fromARGB(255, 153, 153, 153),
                      ),
                    ),
                    const Text(
                      'Yada',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 153, 153, 153)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 60.0,
                        color: const Color.fromARGB(255, 153, 153, 153),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 146, 127, 255),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  fit: BoxFit.contain,
                                  width: 24.0,
                                  height: 24.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
