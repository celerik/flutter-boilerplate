// @packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/business_logic/bloc/basic_state/basic_state_bloc.dart';

// @widgets
import 'package:flutter_boilerplate/screens/root/root.dart';

// @scripts
import 'package:flutter_boilerplate/config/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

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
        BlocProvider<BasicStateBloc>(
          create: (_) => BasicStateBloc(),
        ),
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
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
