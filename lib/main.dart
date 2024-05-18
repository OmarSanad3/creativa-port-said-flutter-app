import 'package:creative_portsaid/widgets/home_screen.dart';
import 'package:creative_portsaid/widgets/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color kBlueColor = const Color(0xFF004F9F);
const Color kYellowColor = const Color(0xFFFDB813);
const Color kGrayColor = const Color(0x60EEEEEE);

var kBlueColorScheme = ColorScheme.fromSeed(
  seedColor: kBlueColor,
);

var kYellowColorScheme = ColorScheme.fromSeed(
  seedColor: kYellowColor,
);

var kGrayColorScheme = ColorScheme.fromSeed(
  seedColor: kGrayColor,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Retrieve saved state from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative PortSaid',
      theme: ThemeData(
        colorScheme: kBlueColorScheme,
        useMaterial3: true,
      ),
      home: isLoggedIn ? HomeScreen() : LoginPage(),
    );
  }
}
