// @packages
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

// @scripts
import 'package:flutter_boilerplate/amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugins([authPlugin]);

  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}