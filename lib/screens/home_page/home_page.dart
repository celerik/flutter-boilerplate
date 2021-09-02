// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/boton_azul.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';

import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: HeaderPainter(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Logo()],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Icon(Icons.logout, color: Colors.white))
              ],
            ),
            SizedBox(
              height: size.height * 0.25,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text.second_screen,
                      style: const TextStyle(fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BotonAzul(
                        sizeWidth: size.width * 0.5,
                        text: text.second_screen,
                        onPressed: () => {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      final email = await SharedPrefs().getValueFromKey('email');
      final cognitoUser = CognitoUser(email, userPool);
      await cognitoUser.signOut();
      await SharedPrefs().reset();
      await Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showSnackBar(context, e.toString(), 'success');
    }
  }
}
