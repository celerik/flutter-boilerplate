// @packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';

class PinCodeText extends StatelessWidget {
  final VoidCallback onComplete;
  final StreamController<ErrorAnimationType> errorAnimationController;
  final TextEditingController controller;
  final int length;
  final double width;
  final double height;
  final double borderRadius;

  const PinCodeText({
    Key key,
    @required this.onComplete,
    @required this.errorAnimationController,
    @required this.controller,
    @required this.length,
    @required this.width,
    @required this.height,
    @required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoDisposeControllers: false,
      length: length,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(borderRadius),
        fieldHeight: height,
        fieldWidth: width,
        activeColor: CustomColors().success,
        selectedFillColor: CustomColors().inputBackground,
        selectedColor: CustomColors().inputBackground,
        inactiveFillColor: CustomColors().inputBackground,
        activeFillColor: CustomColors().inputBackground,
        inactiveColor: CustomColors().inputBorder,
      ),
      cursorColor: CustomColors().white,
      textStyle: TextStyle(fontSize: 15),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorAnimationController,
      controller: controller,
      keyboardType: TextInputType.number,
      boxShadows: [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        ),
      ],
      onCompleted: (_) => onComplete(),
      onChanged: (_) => Function,
    );
  }
}
