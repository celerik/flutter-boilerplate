// @packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(text!.title),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.second_screen, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
