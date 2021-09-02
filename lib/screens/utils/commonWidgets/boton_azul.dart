import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double sizeWidth;
  const BotonAzul(
      {required this.text,
      required this.onPressed,
      this.sizeWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
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
