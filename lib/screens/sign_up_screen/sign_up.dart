// @packages
import 'dart:io';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/input_text.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/business_logic/bloc/user_auth_state/user_auth_state_bloc.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _image;
  final _userNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formSignKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _confirmPasswordController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColors().background,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(children: [
              Text(
                text.sign_up_title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Sign Up Form
              _signUpForm(),
              // Login Button
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(text.already_account),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _signUpForm() {
    final text = AppLocalizations.of(context);

    String commonValidator(String value) {
      if (value.isEmpty) {
        return text.empty_value;
      }
      return null;
    }

    return Form(
      key: _formSignKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          InputText(
            controller: _userNameController,
            labelString: text.user_name,
            keyboardType: TextInputType.name,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          InputText(
            controller: _lastNameController,
            labelString: text.last_name,
            keyboardType: TextInputType.name,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          InputText(
            controller: _emailController,
            labelString: text.email,
            keyboardType: TextInputType.emailAddress,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          InputText(
            controller: _phoneNumberController,
            labelString: text.phone_number,
            keyboardType: TextInputType.phone,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          InputText(
            controller: _passwordController,
            labelString: text.password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          InputText(
            controller: _confirmPasswordController,
            labelString: text.confirm_password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            backgroundColor: CustomColors().inputBackground,
            borderColor: CustomColors().inputBorder,
            labelStyle: TextStyle(color: CustomColors().inputLabel),
            textStyle: TextStyle(color: CustomColors().black),
            height: 45,
            width: MediaQuery.of(context).size.width,
            validator: commonValidator,
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: _signUp,
            child: Text(text.sign_up),
          )
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    final text = AppLocalizations.of(context);
    final username = _userNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final userAuthBloc = BlocProvider.of<UserAuthStateBloc>(context);
    _formSignKey.currentState.validate();

    if (checkTextControllers([username, password, email, phoneNumber])) {
      try {
        final userAttributes = {'name': username, 'phone_number': '+$phoneNumber'};

        await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes),
        );

        userAuthBloc.add(AddUserState(email: email, userName: username));
        showSnackBar(context, text.sign_up_success, 'success');
        await Navigator.pushNamed(context, '/verifyAccount');
      } on AuthException catch (e) {
        showSnackBar(context, e.message, 'error');
      }
    }
  }
}
