import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pickapp/services/auth.services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: const LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'E-Postanız',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          EmailValidator.validate(value!.trim())
                              ? null
                              : "Boş bırakmayın yada doğru bir email girin.",
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Şifreniz*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Boş bırakmayınız';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: const Text('Giriş Yap'),
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
                              const Text(
                                'Google ile kayıt ol',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
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
