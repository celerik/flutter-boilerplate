// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/input_text.dart';
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
    final text = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: CustomColors().background,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(top: 140),
            child: Column(
              children: [
                Text(
                  text!.recover_password,
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _forgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordForm() {
    final text = AppLocalizations.of(context);

    String? commonValidator(String value) {
      if (value.isEmpty) {
        return text!.empty_value;
      }
      return null;
    }

    return Form(
      key: _formForgotPasswordKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !_showOtherFields
              ? InputText(
                  controller: _usernameController,
                  labelString: text!.email,
                  backgroundColor: CustomColors().inputBackground,
                  keyboardType: TextInputType.emailAddress,
                  borderColor: CustomColors().inputBorder,
                  labelStyle: TextStyle(color: CustomColors().inputLabel),
                  textStyle: TextStyle(color: CustomColors().black),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                )
              : SizedBox.shrink(),
          SizedBox(height: 10),
          _showOtherFields
              ? Column(
                  children: [
                    InputText(
                      controller: _codeController,
                      labelString: text!.code,
                      backgroundColor: CustomColors().inputBackground,
                      keyboardType: TextInputType.number,
                      borderColor: CustomColors().inputBorder,
                      labelStyle: TextStyle(color: CustomColors().inputLabel),
                      textStyle: TextStyle(color: CustomColors().black),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      validator: commonValidator,
                    ),
                    SizedBox(height: 10),
                    InputText(
                      controller: _passwordController,
                      labelString: text.password,
                      backgroundColor: CustomColors().inputBackground,
                      keyboardType: TextInputType.visiblePassword,
                      borderColor: CustomColors().inputBorder,
                      labelStyle: TextStyle(color: CustomColors().inputLabel),
                      textStyle: TextStyle(color: CustomColors().black),
                      height: 45,
                      obscureText: true,
                      width: MediaQuery.of(context).size.width,
                      validator: commonValidator,
                    ),
                    SizedBox(height: 10),
                    InputText(
                      controller: _passwordVerificationController,
                      labelString: text.confirm_password,
                      backgroundColor: CustomColors().inputBackground,
                      keyboardType: TextInputType.visiblePassword,
                      borderColor: CustomColors().inputBorder,
                      labelStyle: TextStyle(color: CustomColors().inputLabel),
                      textStyle: TextStyle(color: CustomColors().black),
                      height: 45,
                      obscureText: true,
                      width: MediaQuery.of(context).size.width,
                      validator: commonValidator,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          ElevatedButton(
            onPressed: _recoverPassword,
            child: Text(!_showOtherFields ? text!.send_code : text!.change_password),
          )
        ],
      ),
    );
  }

  Future<void> _recoverPassword() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final passwordConfirmation = _passwordVerificationController.text.trim();
    final code = _codeController.text.trim();
    final text = AppLocalizations.of(context);

    if (!_showOtherFields && checkTextControllers([email]) ||
        _showOtherFields && checkTextControllers([code, password, passwordConfirmation])) {
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
