import 'package:demo/our_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DemoApp()));

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 245, 222),
      body: Center(
        child: AnimatedButton(buttonText: "demo button")
      ),
    );
  }
}