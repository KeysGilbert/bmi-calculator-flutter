import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //properties of this widget
  final Color colour;
  final Widget cardChild;

  ReusableCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), //for rounded edges
        color: colour,
      ),
      child: cardChild,
    );
  }
}
