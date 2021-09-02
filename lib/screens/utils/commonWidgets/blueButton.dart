import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double sizeWidth;
  const BlueButton(
      {required this.text,
      required this.onPressed,
      this.sizeWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        onPrimary: Colors.blue,
        shape: StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Container(
        width: sizeWidth,
        height: 55,
        child: Center(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}
