// @packages
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Widget 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Widget 2',
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
