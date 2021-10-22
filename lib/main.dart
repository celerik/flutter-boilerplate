import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/blocs/pages/home/home_bloc.dart';
import 'package:google_maps/pages/request_permission_page.dart';
import 'package:google_maps/pages/splash_page.dart';
import 'blocs/pages/home/home_state.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CelerikMap base',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(HomeState.initialState),
          ),
        ],
        child: SplashPage(),
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        RequestPermissionPage.routeName: (_) => RequestPermissionPage(),
      },
    );
  }
}
