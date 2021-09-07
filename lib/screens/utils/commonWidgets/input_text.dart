// @packages
import 'package:flutter/material.dart';

//@scripts
import 'package:flutter_boilerplate/business_logic/utils/regex.dart';
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class InputText extends StatefulWidget {
  final String labelString;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle labelStyle;
  final TextStyle textStyle;
  final Function? validator;
  final double width;
  final double height;
  final bool obscureText;
  final bool? error;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const InputText({
    Key? key,
    required this.labelString,
    required this.backgroundColor,
    required this.borderColor,
    required this.labelStyle,
    required this.controller,
    required this.textStyle,
    required this.height,
    required this.width,
    this.validator,
    this.error,
    this.obscureText = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputText();
}

class _InputText extends State<InputText> {
  final _focus = FocusNode();
  String text = '';
  String errorText = '';
  bool _inputError = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.error != null) {
      _inputError = widget.error!;
    }
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: widget.backgroundColor));
    final configText = S.of(context);

    return Container(
      width: widget.width - 20,
      height: widget.height,
      key: widget.key,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: text.isEmpty && !_focus.hasFocus
          ? EdgeInsets.only(left: 15, right: 15)
          : EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(
            color: !_inputError ? widget.borderColor : CustomColors().error,
            width: 2),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: TextFormField(
        style: widget.textStyle,
        controller: widget.controller,
        focusNode: _focus,
        validator: (String? value) {
          if (value!.isEmpty) {
            if (widget.validator != null) {
              final res = widget.validator!(value);
              setState(() => errorText = res);
            }
            setState(() => _inputError = true);
          } else {
            if (widget.keyboardType == TextInputType.emailAddress) {
              final regex = RegExp(RegexExpressions().emailPattern);
              if (!regex.hasMatch(value)) {
                setState(() {
                  errorText = configText.valid_email_regex;
                  _inputError = true;
                });
              }
            }
          }
          return null;
        },
        obscureText: !_showPassword ? widget.obscureText : !_showPassword,
        onChanged: (String value) {
          setState(() => text = value);
          if (value.isNotEmpty) {
            setState(() {
              _inputError = false;
            });
          }
        },
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: !_inputError ? widget.labelString : errorText,
          labelStyle: !_inputError
              ? widget.labelStyle
              : TextStyle(color: CustomColors().error),
          focusedBorder: border,
          border: border,
          enabledBorder: border,
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  padding: _focus.hasFocus || text.isNotEmpty
                      ? EdgeInsets.only()
                      : EdgeInsets.zero,
                  icon: Icon(
                    !_showPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    color: CustomColors().inputLabel,
                  ),
                  onPressed: () =>
                      setState(() => _showPassword = !_showPassword),
                )
              : null,
        ),
      ),
    );
  }
}
