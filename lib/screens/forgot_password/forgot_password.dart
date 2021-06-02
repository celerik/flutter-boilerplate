// @packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  final _formForgotPasswordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
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
          InputText(
            controller: _usernameController,
            labelString: text!.email,
            backgroundColor: CustomColors().inputBackground,
            keyboardType: TextInputType.emailAddress,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _recoverPassword,
            child: Text(text.send_code),
          )
        ],
      ),
    );
  }

  Future<void> _recoverPassword() async {
    final email = _usernameController.text.trim();
    final text = AppLocalizations.of(context);
    _formForgotPasswordKey.currentState!.validate();

    if (checkTextControllers([email])) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showSnackBar(context, text!.sign_up_success, 'success');
        await Navigator.pushReplacementNamed(context, '/');
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    } else {
      showSnackBar(context, text!.fields_required, 'error');
    }
  }
}
