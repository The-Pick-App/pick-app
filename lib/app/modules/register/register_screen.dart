import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pickapp/services/models/register.dart';
import 'package:pickapp/services/auth.services.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: const RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final AuthService authService = AuthService();

  Register register = Register(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    passwordConfirmation: '',
  );

  void registerUser() {
    register.firstName = firstNameController.text.trim();
    register.lastName = lastNameController.text.trim();
    register.email = emailController.text.trim();
    register.password = passwordController.text.trim();
    register.passwordConfirmation = passwordConfirmationController.text.trim();

    authService.registerUser(context: context, registerData: register);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    child: SizedBox(
                      // <--- SizedBox
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          hintText: 'Adınız',
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
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      // <--- SizedBox
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Soy Adınız',
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
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      // <--- SizedBox
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'E-Posta',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            EmailValidator.validate(value!.trim())
                                ? null
                                : "Boş bırakmayın yada doğru bir email girin.",
                      ),
                    ),
                  ),
                ),
                //pasword
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      // <--- SizedBox
                      child: TextFormField(
                        controller: passwordController,
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
                ),
                //passwordconfirm
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      // <--- SizedBox
                      child: TextFormField(
                        controller: passwordConfirmationController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Şifre Tekrar*',
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
                          if (formKey.currentState!.validate()) {
                            registerUser();
                          }
                        },
                        child: const Text('Hesabımı Oluştur'),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
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
                    margin: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: const Size.fromHeight(44),
                        ),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png',
                                fit: BoxFit.contain, width: 24.0, height: 24.0),
                            const Text(
                              'Google ile giriş yap',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabınız var mı?',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Giriş Yapın',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 146, 127, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
