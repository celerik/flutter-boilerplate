import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final width;
  Logo({this.width});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/celerik.png'),
            ),
          ],
        ),
      ),
    );
  }
}
