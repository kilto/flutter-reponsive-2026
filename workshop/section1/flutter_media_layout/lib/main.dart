import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text("LayoutBuilder + MediaQuery")), body: const ResponsiveCard()),
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 1️⃣ MediaQuery → full screen info
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth >= 600;

    return Padding(
      padding: EdgeInsets.all(isTablet ? 32 : 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 2️⃣ LayoutBuilder → actual widget width
          final boxWidth = constraints.maxWidth;

          final useVerticalLayout = boxWidth < 600;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(16)),
            child: useVerticalLayout ? Column(children: _contentWidgets()) : Row(children: _contentWidgets()),
          );
        },
      ),
    );
  }

  List<Widget> _contentWidgets() {
    return [
      const Icon(Icons.phone_android, size: 80),
      const SizedBox(width: 16, height: 16),
      const Expanded(
        child: Text("This layout adapts using MediaQuery + LayoutBuilder", style: TextStyle(fontSize: 18)),
      ),
    ];
  }
}
