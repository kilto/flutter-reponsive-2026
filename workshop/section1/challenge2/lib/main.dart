import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AdaptiveNavigationApp(),
    );
  }
}

class AdaptiveNavigationApp extends StatefulWidget {
  const AdaptiveNavigationApp({super.key});

  @override
  State<AdaptiveNavigationApp> createState() => _AdaptiveNavigationAppState();
}

class _AdaptiveNavigationAppState extends State<AdaptiveNavigationApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if screen width is less than 600px
        final isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          body: Row(
            children: [
              // NavigationRail for large screens (width >= 600px)
              if (!isSmallScreen)
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.none, // ไม่แสดงข้อความ แค่ไอคอน
                  backgroundColor: Colors.grey.shade100,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                ),
              
              // Main content area
              Expanded(
                child: _pages[_selectedIndex],
              ),
            ],
          ),
          
          // BottomNavigationBar for small screens (width < 600px)
          bottomNavigationBar: isSmallScreen
              ? NavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  backgroundColor: Colors.grey.shade100,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black87,
        ),
      ),
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black87,
        ),
      ),
    );
  }
}