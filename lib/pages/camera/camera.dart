
import 'package:flutter/material.dart';


import 'package:argonovo/generated/l10n.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(S.current.title)),
    );
  }
}
