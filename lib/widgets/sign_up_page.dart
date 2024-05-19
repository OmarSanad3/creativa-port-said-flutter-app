import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/widgets/home_screen.dart';
import 'package:creative_portsaid/widgets/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

String getFirstAndLastName(String fullName) {
  final List<String> names = fullName.split(" ");
  return "${names[0]} ${names.length > 1 ? names[names.length - 1] : ""}";
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController englishNameController = TextEditingController();
  final TextEditingController arabicNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

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
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        'lib/assets/creativa_logo.jpg',
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "English Name",
                        obscureText: false,
                        controller: englishNameController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field Can't Be Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Arabic Name",
                        obscureText: false,
                        controller: arabicNameController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field Can't Be Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Phone Number",
                        obscureText: false,
                        controller: phoneNumberController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field Can't Be Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Email",
                        obscureText: false,
                        controller: emailController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field Can't Be Empty";
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
                            return "This Field Can't Be Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        txt: "Confirm Password",
                        obscureText: true,
                        controller: confirmPasswordController,
                        validator: (val) {
                          if (val == "") {
                            return "This Field Can't Be Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      isLoading
                          ? const CircularProgressIndicator()
                          : _buildButton(
                              "Sign Up",
                              () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    final userCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );

                                    final user = userCredential.user;
                                    if (user != null) {
                                      user.updateDisplayName(
                                        getFirstAndLastName(
                                          englishNameController.text.trim(),
                                        ),
                                      );
                                      await _firestore
                                          .collection('users')
                                          .doc(user.uid)
                                          .set(
                                        {
                                          'englishName':
                                              englishNameController.text,
                                          'arabicName':
                                              arabicNameController.text,
                                          'phoneNumber':
                                              phoneNumberController.text,
                                          'createdAt':
                                              FieldValue.serverTimestamp(),
                                        },
                                      );
                                    }

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      _customeSnackBar(
                                        context,
                                        "The password provided is too weak.",
                                      );
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      _customeSnackBar(
                                        context,
                                        "The account already exists for that email.",
                                      );
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    _customeSnackBar(context, e.toString());
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
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

ScaffoldFeatureController _customeSnackBar(BuildContext context, String txt) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(txt),
    ),
  );
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
      const Text("Alread have an account?"),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Text(
          "Log In",
          style: TextStyle(color: kGrayColor),
        ),
      ),
    ],
  );
}
