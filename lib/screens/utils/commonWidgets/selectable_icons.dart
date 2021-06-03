// @packages
import 'package:flutter/material.dart';

/// This class represents a selectable icons. When the user clicks on the icons this takes a color
/// which indicates that the element is selected. Feel free to add or modify more properties.
class SelectableIcon extends StatelessWidget {
  /// Main icon of the button
  final IconData icon;

  /// Main background color for the icon
  final Color backgroundColor;

  /// Color when the icon is selected
  final Color onSelectedColor;

  /// Main color for the color
  final Color iconColor;

  /// Variable to check whether the icon is selected or not
  final bool isPressed;

  /// Function for tapping the button
  final VoidCallback onTap;

  /// Width for the entire widget
  final double? width;

  /// Height for the entire widget
  final double? height;

  /// Border when the icon is selected. If you need to add a new property when the border is selected
  /// just add new one when the element is not element.
  final double? borderWidth;

  /// Size for the icon
  final double? iconSize;

  const SelectableIcon({
    Key? key,
    this.width,
    this.height,
    this.borderWidth,
    this.iconSize,
    required this.onTap,
    required this.isPressed,
    required this.icon,
    required this.backgroundColor,
    required this.onSelectedColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      splashColor: !isPressed ? backgroundColor : onSelectedColor.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !isPressed ? backgroundColor : onSelectedColor.withOpacity(0.2),
          border: isPressed
              ? Border.all(color: onSelectedColor, width: borderWidth ?? 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Icon(
          icon,
          color: !isPressed ? iconColor : onSelectedColor,
          size: iconSize,
        ),
      ),
    );
  }
}
