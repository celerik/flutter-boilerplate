// @packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/config/theme/custom_theme.dart';
import 'package:flutter_boilerplate/screens/root/root.dart';
import 'package:flutter_boilerplate/screens/second_screen/second_screen.dart';
import 'package:flutter_boilerplate/business_logic/bloc/basic_state/basic_state_bloc.dart';
import 'package:flutter_boilerplate/screens/sign_up_screen/sign_up.dart';
import 'package:flutter_boilerplate/screens/verify_account/verify_email.dart';
import 'package:flutter_boilerplate/business_logic/bloc/user_auth_state/user_auth_state_bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/amplify_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await configureAmplify();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BasicStateBloc>(create: (_) => BasicStateBloc()),
        BlocProvider<UserAuthStateBloc>(create: (_) => UserAuthStateBloc()),
      ],
      child: FlutterBaseline(),
    );
  }
}

class FlutterBaseline extends StatelessWidget {
  const FlutterBaseline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: CustomTheme().lightTheme,
      routes: {
        '/': (context) => const Root(),
        '/secondScreen': (context) => const SecondScreen(),
        '/signUp': (context) => const SignUpPage(),
        '/verifyAccount': (context) => const VerifyPage()
      },
    );
  }
}
