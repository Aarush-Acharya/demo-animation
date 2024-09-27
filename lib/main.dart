import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DemoApp()));

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  double bottomPadding = 6;
  double rightPadding = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 245, 222),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            setState(() {
              bottomPadding = 0;
              rightPadding = 0;
            });
            await Future.delayed(Duration(milliseconds: 100));
            setState(() {
              bottomPadding = 6;
              rightPadding = 4;
            });
          },
          child: AnimatedContainer(
            duration: Duration(
              milliseconds: 100,
            ),
            padding:
                EdgeInsets.only(bottom: bottomPadding, right: rightPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 43, 42, 42),
            ),
            child: Container(
              constraints: BoxConstraints(maxHeight: 60, maxWidth: 200),
              child: Center(
                  child: Text(
                "Verify Phone",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 63, 224, 146)),
            ),
          ),
        ),
      ),
    );
  }
}
