import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator.dart';

enum Gender { MALE, FEMALE }

  int userHeight = 180; //centimeters
  int userWeight = 60; //kilograms
  int userAge = 0;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  child: ReusableCard(
                    colour: tappedCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              userHeight.toString(),
                              style: numberStyle,
                            ),
                            Text("cm", style: labelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pink,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 15),
                            overlayColor: Colors.pink,
                          ),
                          child: Slider(
                              value: userHeight.toDouble(),
                              min: 120,
                              max: 220,
                              activeColor: Colors.pink,
                              inactiveColor: Colors.grey[200],
                              onChanged: (double newValue) {
                                setState(() {
                                  userHeight = newValue.round();
                                });
                              }),
                        ),
                      ],
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
                  child: ReusableCard(
                    colour: tappedCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Weight", style: labelTextStyle),
                        Text(
                          userWeight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (userWeight > 0) {
                                    userWeight--;
                                  } else {
                                    null;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: tappedCardColor,
                    cardChild: Column(children: <Widget>[
                      Text(
                        "Age",
                        style: labelTextStyle,
                      ),
                      Text(
                        userAge.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (userAge > 0) {
                                    userAge--;
                                  } else {
                                    null;
                                  }
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                userAge++;
                              });
                            },
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              Calculator().calculateBMI(userWeight, userHeight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
