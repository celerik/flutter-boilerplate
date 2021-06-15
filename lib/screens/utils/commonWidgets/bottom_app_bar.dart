// @packages
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/home_page/home_page.dart';
import 'package:flutter_boilerplate/screens/second_page/second_page.dart';

class BottomAppBarContainer extends StatefulWidget {
  const BottomAppBarContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomAppBar();
}

class _BottomAppBar extends State<BottomAppBarContainer> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SecondPage()
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: text!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: text!.firebase_crud,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
