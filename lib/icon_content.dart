import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  //widget properties
  final IconData icon;
  final String label;

  IconContent({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
