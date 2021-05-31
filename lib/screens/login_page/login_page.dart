// @packages
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/input_text.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColors().background,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(top: 140),
            child: Column(
              children: [
                Text(
                  text.login_message,
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _loginForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/signUp'),
                        child: Text(text.do_not_have_account),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/forgotPassword'),
                      child: Text(text.forgot_password),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    final text = AppLocalizations.of(context);

    String commonValidator(String value) {
      if (value.isEmpty) {
        return text.empty_value;
      }
      return null;
    }

    return Form(
      key: _formLoginKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputText(
            controller: _usernameController,
            labelString: text.email,
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
          InputText(
            controller: _passwordController,
            labelString: text.password,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator: commonValidator,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _login,
            child: Text(text.login),
          )
        ],
      ),
    );
  }

  Future<void> _login() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    _formLoginKey.currentState.validate();

    if (checkTextControllers([password, email])) {
      try {
        await Amplify.Auth.signIn(
          username: email,
          password: password,
        );

        await Navigator.pushReplacementNamed(context, '/');
      } on AuthException catch (e) {
        showSnackBar(context, e.message, 'error');
      }
    }
  }
}
