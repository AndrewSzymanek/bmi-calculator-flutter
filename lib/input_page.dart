import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_column.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0XFF1D1E33);
const inactiveCardColor = Color(0XFF111328);
const bottomContainerColor = Color(0XFFEB1555);
enum Gender {
  male,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                child: ReusableCard(
                color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                  cardChild: ReusableColumn(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                  cardChild: ReusableColumn(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            color: activeCardColor,
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                color: activeCardColor,
              ),
              ),
              Expanded(child: ReusableCard(
                color: activeCardColor,
              ),
              ),
            ],
          ) ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      )
    );
  }
}




