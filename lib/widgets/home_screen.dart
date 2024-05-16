import 'package:creative_portsaid/models/custom_list_item.dart';
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
      screen: const Center(child: Text('About Creativa Port Said')),
    ),
    CustomListItem(
      title: "Profile",
      icon: Icons.person,
      screen: const Center(child: Text('Profile Screen')),
    ),
    CustomListItem(
      title: "Courses",
      icon: Icons.school_rounded,
      screen: const Center(child: Text('Courses')),
    ),
    CustomListItem(
      title: "Creativa Workspace",
      icon: Icons.workspace_premium,
      screen: const Center(child: Text('Creativa Workspace')),
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
