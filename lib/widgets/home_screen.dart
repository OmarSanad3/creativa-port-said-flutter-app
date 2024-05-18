import 'package:creative_portsaid/models/custom_list_item.dart';
import 'package:creative_portsaid/widgets/screens/about_creativa_screen.dart';
import 'package:creative_portsaid/widgets/screens/courses_screen.dart';
import 'package:creative_portsaid/widgets/screens/creativa_workspace_screen.dart';
import 'package:creative_portsaid/widgets/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CustomListItem? _currScreen;

  @override
  void initState() {
    _currScreen = _screens[0];
    super.initState();
  }

  final List<CustomListItem> _screens = [
    CustomListItem(
      title: "About Creativa Port Said",
      icon: Icons.info_rounded,
      screen: const AboutCreativaScreen(),
    ),
    CustomListItem(
      title: "Profile",
      icon: Icons.person,
      screen: const ProfileScreen(),
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
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
          ],
        ),
      ),
    );
  }
}
