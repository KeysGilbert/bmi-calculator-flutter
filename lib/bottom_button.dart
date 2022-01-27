import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: bottomHeight,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            buttonTitle,
            style: largeButtonText,
          ),
        ),
      ),
    );
  }
}
