import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/images/celerik.png')),
          ],
        ),
      ),
    );
  }
}
