import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  double verticalShadow;
  double horizontalShadow;
  String buttonText;

  AnimatedButton({
    super.key,
    this.verticalShadow = 6.0, // Set the default value here
    this.horizontalShadow = 4.0, // Set the default value here
    required this.buttonText
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        double placeholderVertical = widget.verticalShadow;
        double placeholderHorizontal = widget.horizontalShadow;
        setState(() {
          widget.verticalShadow = 0;
          widget.horizontalShadow = 0;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          widget.verticalShadow = placeholderVertical;
          widget.horizontalShadow = placeholderHorizontal;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(
            bottom: widget.verticalShadow, right: widget.horizontalShadow),
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
                widget.buttonText,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
