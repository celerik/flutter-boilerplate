// @packages
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({Key? key, required this.width}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: const <Widget>[
            Image(
              image: AssetImage('assets/images/celerik.png'),
            ),
          ],
        ),
      ),
    );
  }
}
