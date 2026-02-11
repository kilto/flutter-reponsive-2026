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
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Responsive Padding Challenge")),
        ),
        body: const ResponsiveCard(),
      ),
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the actual widget width
        final screenWidth = constraints.maxWidth;
        
        // Determine if it's a small screen (< 600px)
        final isSmallScreen = screenWidth < 600;
        
        // Set padding: 12 for small, 32 for large
        final padding = isSmallScreen ? 12.0 : 32.0;
        
        // Set text: "Small Screen" or "Large Screen"
        final screenText = isSmallScreen ? "Small Screen" : "Large Screen";

        return Padding(
          padding: EdgeInsets.all(padding), 
          child: Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0), 
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                screenText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}