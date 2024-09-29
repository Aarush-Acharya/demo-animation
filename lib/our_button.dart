import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double verticalShadow; // Mark fields as final
  final double horizontalShadow; // Mark fields as final
  final String buttonText; // Mark fields as final

  const AnimatedButton({
    super.key,
    this.verticalShadow = 6.0, // Set the default value here
    this.horizontalShadow = 4.0, // Set the default value here
    required this.buttonText,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  // Mutable state variables
  late double currentVerticalShadow;
  late double currentHorizontalShadow;

  @override
  void initState() {
    super.initState();
    // Initialize state with widget properties
    currentVerticalShadow = widget.verticalShadow;
    currentHorizontalShadow = widget.horizontalShadow;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        double placeholderVertical = currentVerticalShadow;
        double placeholderHorizontal = currentHorizontalShadow;
        setState(() {
          currentVerticalShadow = 0;
          currentHorizontalShadow = 0;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          currentVerticalShadow = placeholderVertical;
          currentHorizontalShadow = placeholderHorizontal;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(
            bottom: currentVerticalShadow, right: currentHorizontalShadow),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 43, 42, 42),
        ),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 200),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 63, 224, 146)),
          child: Center(
              child: Text(
            widget.buttonText, // Use the widget's immutable property
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
