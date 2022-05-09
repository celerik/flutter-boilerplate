// @packages
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/camera/camera.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Root();
}

class _Root extends State<Root> {

  @override
  Widget build(BuildContext context) {
    return CameraScreen();
  }
}
