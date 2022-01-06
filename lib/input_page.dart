import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const Color tappedCardColor = Color(0xFF1d1e33);
const double bottomHeight = 80.0;
const Color inactiveCardColor = Color(0xFF111328);

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.MALE && maleColor == inactiveCardColor) {
      maleColor = tappedCardColor;
      femaleColor = inactiveCardColor;
    } else {
      maleColor = inactiveCardColor;
    }

    if (selectedGender == Gender.FEMALE && femaleColor == inactiveCardColor) {
      femaleColor = tappedCardColor;
      maleColor = inactiveCardColor;
    } else {
      femaleColor = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.MALE);
                      });
                    },
                    child: ReusableCard(
                      colour: maleColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.FEMALE);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: tappedCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: tappedCardColor),
                ),
                Expanded(
                  child: ReusableCard(colour: tappedCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            width: double.infinity,
            height: bottomHeight,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}
