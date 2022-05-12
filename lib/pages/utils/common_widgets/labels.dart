
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String path;
  final String title;
  final String subheading;

  const Labels({
    Key? key,
    required this.path,
    required this.title,
    required this.subheading,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, path);
          },
          child: Text(subheading,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
