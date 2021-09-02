import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/business_logic/bloc/user_auth_state/user_auth_state_bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/boton_azul.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/custom_input.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/labels.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: CustomPaint(
              painter: HeaderPainter(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Logo(),
                    _Form(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
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
    final text = S.of(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formSignKey,
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.perm_identity,
              placeholder: text.user_name,
              keyboardType: TextInputType.text,
              textController: _userNameController,
            ),
            CustomInput(
              icon: Icons.perm_identity,
              placeholder: text.last_name,
              keyboardType: TextInputType.text,
              textController: _lastNameController,
            ),
            CustomInput(
              icon: Icons.mail_outline,
              placeholder: text.email,
              keyboardType: TextInputType.emailAddress,
              textController: _emailController,
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: text.password,
              textController: _passwordController,
              isPassword: true,
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: text.confirm_password,
              textController: _confirmPasswordController,
              isPassword: true,
            ),
            CustomInput(
              icon: Icons.phone,
              placeholder: text.phone_number,
              keyboardType: TextInputType.phone,
              textController: _phoneNumberController,
            ),
            BotonAzul(
              text: text.sign_up,
              onPressed: _signUp,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    print('entra');
    final text = S.of(context);
    final username = _userNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final userAuthBloc = BlocProvider.of<UserAuthStateBloc>(context);
    _formSignKey.currentState!.validate();

    if (checkTextControllers([username, password, email, phoneNumber])) {
      try {
        final userAttributes = [
          AttributeArg(name: 'name', value: username),
          AttributeArg(name: 'phone_number', value: '+$phoneNumber'),
        ];

        await userPool.signUp(
          email,
          password,
          userAttributes: userAttributes,
        );

        userAuthBloc.add(AddUserState(email: email, userName: username));
        showSnackBar(context, text.sign_up_success, 'success');
        await Navigator.pushNamed(context, '/verifyAccount');
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    }
  }
}
