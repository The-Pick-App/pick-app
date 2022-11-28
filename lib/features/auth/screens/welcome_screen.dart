import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

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
                      padding: const EdgeInsets.symmetric(vertical: 65.0),
                      child: Container(
                        height: 1.0,
                        width: 60.0,
                        color: const Color.fromARGB(255, 153, 153, 153),
                      ),
                    ),
                    Image.asset('assets/images/logo.png',
                        fit: BoxFit.contain, width: 125.0, height: 125.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22.0),
                      child: Container(
                        color: const Color.fromARGB(255, 153, 153, 153),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'PICK APP',
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: () {
                              Routemaster.of(context).push('/demo');
                            },
                            child: const Text('İçeri Gir Direk DEMO'),
                          ),
                        ),
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
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                      ),
                      onPressed: () {
                        Routemaster.of(context).push('/login');
                      },
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
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                      ),
                      onPressed: () {
                        Routemaster.of(context).push('/register');
                      },
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
                      height: 2.0,
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: const Color.fromARGB(255, 234, 234, 234),
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
                      height: 2.0,
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: const Color.fromARGB(255, 234, 234, 234),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.g_mobiledata_outlined,
                    ),
                    iconSize: 56,
                    splashRadius: 28,
                    splashColor: const Color.fromARGB(255, 146, 127, 255),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
