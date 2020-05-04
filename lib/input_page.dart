import 'package:flutter/foundation.dart';
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

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(Gender selectedGender){
    if(selectedGender == Gender.male){
      if(maleCardColor == inactiveCardColor){
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
      else{
        maleCardColor = inactiveCardColor;
      }
    }
    else{
      if(femaleCardColor == inactiveCardColor){
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
      else{
        femaleCardColor = inactiveCardColor;
      }
    }
  }

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
                      updateColor(Gender.male);
                    });
                  },
                child: ReusableCard(
                color: maleCardColor,
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
                    updateColor(Gender.female);
                  });
                },
                child: ReusableCard(
                  color: femaleCardColor,
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




