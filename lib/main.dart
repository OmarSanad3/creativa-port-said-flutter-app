import 'package:creative_portsaid/firebase_options.dart';
import 'package:creative_portsaid/widgets/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative PortSaid',
      theme: ThemeData(
        colorScheme: kBlueColorScheme,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
