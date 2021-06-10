// @packages
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatelessWidget {
  final List<Widget>? leftActions;
  final List<Widget>? rightActions;
  final String text;

  const ListItem({
    Key? key,
    this.leftActions,
    this.rightActions,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: rightActions,
        actions: leftActions,
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 40),
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
