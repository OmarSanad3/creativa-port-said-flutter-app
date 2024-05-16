import 'package:creative_portsaid/widgets/sign_up_page.dart';
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
                    _buildTextField("Email", false, emailController),
                    const SizedBox(height: 20),
                    _buildTextField("Password", true, passwordController),
                    const SizedBox(height: 20),
                    _buildButton(
                      "Login",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildAdditionalOptions(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField(
    String label, bool obscureText, TextEditingController controller) {
  return TextField(
    style: const TextStyle(color: Color(0xFF034C9F)),
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: label,
      filled: true,
      fillColor: const Color(0x60EEEEEE),
      focusColor: const Color(0x60EEEEEE),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0x60EEEEEE),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    ),
  );
}

Widget _buildButton(String label, Function onPressed) {
  return ElevatedButton(
    onPressed: () => onPressed(),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0x60EEEEEE),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Color(0x60EEEEEE)),
        ),
      ),
    ],
  );
}
