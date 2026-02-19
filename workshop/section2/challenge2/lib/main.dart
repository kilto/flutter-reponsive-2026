import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() {
  runApp(const HoverDemoApp());
}

class HoverDemoApp extends StatelessWidget {
  const HoverDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HoverDemoPage(),
    );
  }
}

class HoverDemoPage extends StatefulWidget {
  const HoverDemoPage({super.key});

  @override
  State<HoverDemoPage> createState() => _HoverDemoPageState();
}

class _HoverDemoPageState extends State<HoverDemoPage> {
  bool isHover = false;

  void _showActivatedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Activated 🎉'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Mouse & Touch Workshop'))),
      body: Center(
        child: kIsWeb
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => isHover = true),
                onExit: (_) => setState(() => isHover = false),
                child: GestureDetector(
                  onTap: _showActivatedSnackBar,
                  child: _buildButton(),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() => isHover = !isHover);
                  _showActivatedSnackBar();
                },
                child: _buildButton(),
              ),
      ),
    );
  }

  Widget _buildButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 200,
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isHover ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (isHover)
            const BoxShadow(
              blurRadius: 12,
              offset: Offset(0, 6),
              color: Colors.black26,
            )
        ],
      ),
      child: const Text(
        'Hover or Tap Me\n(Mouse / Touch)',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}