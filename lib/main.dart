import 'dart:async';

import 'package:argonovo/business_logic/blocs/basic_state/number_operations_bloc.dart';
import 'package:argonovo/business_logic/services/local_storage/secure_storage.dart';
import 'package:argonovo/config/logger/app_log_output.dart';
import 'package:argonovo/config/theme/theme.dart';
import 'package:argonovo/pages/root/root.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  await _initializeWidgetsFlutterBinding();
  await _enableSystemStatusBar();
  await _initializeGetIt();
  await _initializeSecureStorage();
  await _initializeDotEnv();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: DevicePreview(
        builder: (_) => AppState(),
      ),
    ),
  );
}

Future<void> _initializeGetIt() async {
  await _registerAppDependencies();
}

Future<void> _registerAppDependencies() async {
  GetIt.I.registerLazySingleton<Logger>(() => Logger(output: AppLogOutput()));
}

Future<void> _initializeWidgetsFlutterBinding() async => WidgetsFlutterBinding.ensureInitialized();

Future<void> _enableSystemStatusBar() async => SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

Future<void> _initializeSecureStorage() async => SecureStorage.init();

Future<void> _initializeDotEnv() async => dotenv.load();

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NumberOperationsBloc>(
          create: (_) => NumberOperationsBloc(),
        ),
      ],
      child: Argonovo(),
    );
  }
}

class Argonovo extends StatelessWidget {
  static GlobalKey mtAppKey = GlobalKey();

  const Argonovo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildGlobalLoaderOverlay();
  }

  GlobalLoaderOverlay _buildGlobalLoaderOverlay() => GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayOpacity: 0.7,
        overlayWidget: Center(
          child: CircularProgressIndicator(),
        ),
        child: _buildMaterialApp(),
      );

  MaterialApp _buildMaterialApp() => MaterialApp(
        key: Argonovo.mtAppKey,
        debugShowCheckedModeBanner: false,
        routes: _getAppRoutesInitialization(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      );

  Map<String, Widget Function(dynamic context)> _getAppRoutesInitialization() => {
        AppRoutes.root: (_) => const Root(),
      };
}

class AppRoutes {
  static const root = '/';
}
