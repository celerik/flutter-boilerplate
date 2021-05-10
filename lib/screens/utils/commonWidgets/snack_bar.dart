// @packages
import 'package:flutter/material.dart';

// @packages
import 'package:flutter_boilerplate/config/colors/colors.dart';

void showSnackBar(BuildContext context, String text, String type) {
  Color color;

  if (type.compareTo('error') == 0) {
    color = CustomColors().error;
  } else if (type.compareTo('success') == 0) {
    color = CustomColors().success;
  } else {
    color = CustomColors().error;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(color: CustomColors().white)),
      elevation: 10,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}
