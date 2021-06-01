// @packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/business_logic/bloc/user_auth_state/user_auth_state_bloc.dart';
import 'package:flutter_boilerplate/screens/sign_up_screen/pin_code_text.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _codeUserController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    _codeUserController.dispose();
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColors().appBar,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: CustomColors().background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      width: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(CustomColors().white),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Text('X', style: TextStyle(color: CustomColors().black),),
                      ),
                    )
                  ],
                ),
                SafeArea(
                  minimum: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          text!.verify_email,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        text.verify_text,
                        style: TextStyle(
                          color: CustomColors().inputLabel,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<UserAuthStateBloc, UserAuthStateInitial>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              PinCodeText(
                                onComplete: () => _verifyCode(state.email!),
                                errorAnimationController: errorController!,
                                controller: _codeUserController,
                                length: 6,
                                width: 45,
                                height: 49,
                                borderRadius: 20,
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => _resendCode(state.email!),
                                child: Text(text.resend_code),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyCode(String email) async {
    final text = AppLocalizations.of(context);
    final code = _codeUserController.text.trim();

    if (checkTextControllers([code])) {
      try {

        showSnackBar(context, text!.verify_confirm, 'success');
        await Navigator.pushReplacementNamed(context, '/');
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    }
  }

  Future<void> _resendCode(String email) async {
    final text = AppLocalizations.of(context);

    try {

      showSnackBar(context, text!.code_sent, 'success');
    } catch (e) {
      showSnackBar(context, e.toString(), 'error');
    }
  }
}
