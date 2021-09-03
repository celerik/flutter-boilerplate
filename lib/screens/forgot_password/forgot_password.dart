// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/blueButton.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/custom_input.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/input_text.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _usernameController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerificationController = TextEditingController();
  final _formForgotPasswordKey = GlobalKey<FormState>();
  bool _showOtherFields = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _passwordVerificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: CustomPaint(
          painter: HeaderPainter(),
          child: Column(
            children: [
              Logo(),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        text.recover_password,
                        style: TextStyle(
                          fontSize: size.height * 0.028,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: size.height * 0.014),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _forgotPasswordForm())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordForm() {
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    String? commonValidator(String value) {
      if (value.isEmpty) {
        return text.empty_value;
      }
      return null;
    }

    return Form(
      key: _formForgotPasswordKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !_showOtherFields
              ? CustomInput(
                  icon: Icons.mail_outline,
                  placeholder: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                  textController: _usernameController,
                )
              : SizedBox.shrink(),
          _showOtherFields
              ? Column(
                  children: [
                    CustomInput(
                      icon: Icons.message,
                      placeholder: S.of(context).code,
                      keyboardType: TextInputType.number,
                      textController: _codeController,
                    ),
                    SizedBox(height: 10),
                    CustomInput(
                      icon: Icons.password,
                      placeholder: S.of(context).password,
                      textController: _passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    CustomInput(
                      icon: Icons.password,
                      placeholder: S.of(context).confirm_password,
                      textController: _passwordVerificationController,
                      isPassword: true,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          BlueButton(
              sizeWidth: size.width,
              text: !_showOtherFields ? text!.send_code : text!.change_password,
              onPressed: _recoverPassword)
        ],
      ),
    );
  }

  Future<void> _recoverPassword() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final passwordConfirmation = _passwordVerificationController.text.trim();
    final code = _codeController.text.trim();
    final text = S.of(context);

    if (!_showOtherFields && checkTextControllers([email]) ||
        _showOtherFields &&
            checkTextControllers([code, password, passwordConfirmation])) {
      try {
        final cognitoUser = CognitoUser(email, userPool);

        if (!_showOtherFields) {
          await cognitoUser.forgotPassword();

          setState(() => _showOtherFields = true);
          showSnackBar(context, text!.sign_up_success, 'success');
        } else {
          _formForgotPasswordKey.currentState!.validate();

          if (password.compareTo(passwordConfirmation) == 0) {
            await cognitoUser.confirmPassword(code, passwordConfirmation);

            showSnackBar(context, text!.password_changed, 'success');
            await Navigator.pushReplacementNamed(context, '/');
          } else {
            showSnackBar(context, text!.password_must_be_same, 'error');
          }
        }
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    } else {
      showSnackBar(context, text!.fields_required, 'error');
    }
  }
}
