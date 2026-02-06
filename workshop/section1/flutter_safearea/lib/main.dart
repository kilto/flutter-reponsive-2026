import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SafeAreaDemo(), debugShowCheckedModeBanner: false);
  }
}

class SafeAreaDemo extends StatelessWidget {
  const SafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [Expanded(child: WithSafeArea())]),
      // body: Column(children: const [Expanded(child: WithoutSafeArea())]),
    );
  }
}

class WithoutSafeArea extends StatelessWidget {
  const WithoutSafeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "WITHOUT SafeArea Testing Testing \nText goes under STATUS BAR / NOTCH",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const Text(
            "WITHOUT SafeArea Testing Testing \nText goes under STATUS BAR / NOTCH",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WithSafeArea extends StatelessWidget {
  const WithSafeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.green,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "WITH SafeArea Testing Testing\nText is pushed below STATUS BAR",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const Text(
              "WITH SafeArea Testing Testing \nText is pushed below STATUS BAR",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
