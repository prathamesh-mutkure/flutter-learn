import 'package:bmi_calculator/components/CustomCard.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class ValuesCard extends StatelessWidget {
  final String label;
  final int value;
  final Function onPlusButtonPressed;
  final Function onMinusButtonPressed;

  ValuesCard(
      {this.label,
      this.value,
      this.onPlusButtonPressed,
      this.onMinusButtonPressed});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            value.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPlusButtonPressed,
              ),
              SizedBox(
                width: 15,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onMinusButtonPressed,
              )
            ],
          )
        ],
      ),
    );
  }
}
