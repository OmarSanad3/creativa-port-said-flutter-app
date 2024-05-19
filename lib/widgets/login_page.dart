import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/widgets/home_screen.dart';
import 'package:creative_portsaid/widgets/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'lib/assets/creativa_building.jpeg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black
                    .withOpacity(0.1), // Adjust the opacity if needed
              ),
            ),
            Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/creativa_logo.jpg',
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Email",
                        obscureText: false,
                        controller: emailController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Password",
                        obscureText: true,
                        controller: passwordController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildButton(
                        "Login",
                        () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Wrong Email or Password"),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildAdditionalOptions(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.txt,
    required this.obscureText,
    required this.controller,
    required this.validator,
  });

  final String txt;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(color: kBlueColorScheme.primary),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: txt,
        filled: true,
        fillColor: kGrayColor,
        focusColor: kGrayColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGrayColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}

Widget _buildButton(String label, Function onPressed) {
  return ElevatedButton(
    onPressed: () => onPressed(),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        kGrayColor,
      ),
      foregroundColor: MaterialStateProperty.all(
        Colors.black,
      ),
    ),
    child: Text(label),
  );
}

Widget _buildAdditionalOptions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account?"),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: kGrayColor),
        ),
      ),
    ],
  );
}
