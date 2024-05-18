import 'package:creative_portsaid/widgets/login_page.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative PortSaid',
      theme: ThemeData(
        colorScheme: kBlueColorScheme,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
