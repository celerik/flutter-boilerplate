// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(text.title),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.second_screen, style: const TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/secondScreen'),
              child: Text(text.go_second_screen),
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
      showSnackBar(context, e.message, 'success');
    }
  }
}
