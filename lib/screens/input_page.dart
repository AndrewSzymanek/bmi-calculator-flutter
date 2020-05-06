import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/reusable_column.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

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
  int height = 72;
  int weight = 150;
  int age = 28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: ReusableColumn(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                    ),
                  ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild: ReusableColumn(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                        'in',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0XFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0X35EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: kMin.toDouble(),
                    max: kMax.toDouble(),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                color: kActiveCardColor,
              ),
              ),
              Expanded(child: Row(
                children: <Widget>[
                 Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kActiveCardColor,
                    ),
                  ),
                ],

              ),
              ),
            ],
          ) ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: () {

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);



            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),
            ),
            );
          },),
        ],
      )
    );
  }
}







