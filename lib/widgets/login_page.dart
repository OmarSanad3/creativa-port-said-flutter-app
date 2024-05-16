import 'package:creative_portsaid/widgets/sign_up_page.dart';
import 'package:flutter/material.dart';

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
        child: Center(
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
                          builder: (context) => const Placeholder()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildAdditionalOptions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
    String label, bool obscureText, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      focusColor: const Color(0xFF034C9F),
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
        child: const Text("Sign Up"),
      ),
    ],
  );
}
