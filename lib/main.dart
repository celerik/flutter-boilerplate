// @packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/screens/login_page/login_page.dart';
import 'package:provider/provider.dart';
// @scripts
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/screens/forgot_password/forgot_password.dart';
import 'package:flutter_boilerplate/screens/verify_code/verify_code.dart';
import 'package:flutter_boilerplate/config/theme/theme.dart';
import 'package:flutter_boilerplate/screens/root/root.dart';
import 'package:flutter_boilerplate/screens/second_screen/second_screen.dart';
import 'package:flutter_boilerplate/business_logic/bloc/basic_state/basic_state_bloc.dart';
import 'package:flutter_boilerplate/screens/sign_up_screen/sign_up.dart';
import 'package:flutter_boilerplate/business_logic/bloc/user_auth_state/user_auth_state_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await dotenv.load(
      fileName:
          ".env"); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: AppState(),
    ),
  );
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

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
  const FlutterBaseline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Root(),
        '/secondScreen': (context) => const SecondScreen(),
        '/signUp': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/verifyAccount': (context) => const VerifyPage(),
        '/forgotPassword': (context) => const ForgotPassword()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
