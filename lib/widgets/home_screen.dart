import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/models/custom_list_item.dart';
import 'package:creative_portsaid/widgets/login_page.dart';
import 'package:creative_portsaid/widgets/screens/about_creativa_screen.dart';
import 'package:creative_portsaid/widgets/screens/courses_screen.dart';
import 'package:creative_portsaid/widgets/screens/creativa_workspace_screen.dart';
import 'package:creative_portsaid/widgets/screens/suggestions_and_complaints.dart';
import 'package:creative_portsaid/widgets/screens/taka_attendance_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void _login(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}

void _logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CustomListItem? _currScreen;
  String _userName = "";
  bool _isGuest = true;

  @override
  void initState() {
    _currScreen = _screens[0];
    updateName();
    super.initState();
  }

  Future<Map<String, dynamic>?> _getUserData() async {
    if (FirebaseAuth.instance.currentUser == null) return null;
    DocumentSnapshot userData = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    return userData.data() as Map<String, dynamic>?;
  }

  String _getFirstAndLastName(String fullName) {
    List<String> names = fullName.split(" ");
    return "${names[0]} ${names.length > 1 ? names[names.length - 1] : ""}";
  }

  void updateName() async {
    final userData = await _getUserData();
    if (userData == null) return;
    setState(() {
      _isGuest = false;
      _userName = _getFirstAndLastName(userData['englishName']);
    });
  }

  final List<CustomListItem> _screens = [
    CustomListItem(
      title: "About Creativa Port Said",
      icon: Icons.info_rounded,
      screen: const AboutCreativaScreen(),
    ),
    CustomListItem(
      title: "Courses",
      icon: Icons.school_rounded,
      screen: const CoursesScreen(),
    ),
    CustomListItem(
      title: "Creativa Workspace",
      icon: Icons.workspace_premium,
      screen: const CreativaWorkspaceScreen(),
    ),
    CustomListItem(
      title: "Take Attendence",
      icon: FontAwesomeIcons.personCircleCheck,
      screen: const TakeAttendanceScreen(),
    ),
    CustomListItem(
      title: "Suggestions & Complaints",
      icon: Icons.feedback,
      screen: const SuggestionsAndComplaintsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currScreen!.title),
      ),
      body: Center(
        child: _currScreen!.screen,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: kBlueColor,
              ),
              child: Column(
                children: [
                  const Text(
                    'Creative Port Said',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      _isGuest
                          ? const Icon(Icons.person)
                          : const Icon(
                              Icons.waving_hand_rounded,
                              color: Colors.white,
                            ),
                      const SizedBox(width: 10),
                      Text(
                        _isGuest ? "Guest Account" : "Hi, $_userName",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            for (int i = 0; i < _screens.length; i++)
              ListTile(
                title: Row(
                  children: [
                    Icon(_screens[i].icon),
                    const SizedBox(width: 10),
                    Text(_screens[i].title),
                  ],
                ),
                onTap: () {
                  if (mounted) Navigator.pop(context);
                  setState(() {
                    _currScreen = _screens[i];
                  });
                },
              ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  _isGuest
                      ? const Icon(Icons.login_outlined)
                      : const Icon(Icons.logout_outlined),
                  const SizedBox(width: 10),
                  Text(_isGuest ? "Login" : "Logout"),
                ],
              ),
              onTap: () {
                _isGuest ? _login(context) : _logout(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
