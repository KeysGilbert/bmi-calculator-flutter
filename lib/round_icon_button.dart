import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon; //the icon that the button will display
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Color(0XFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 58, height: 58),
      child: Icon(icon),
    );
  }
}
