import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'reusable_roundedIconButton.dart';
import 'reusableButton.dart';
import 'calculatorBrain.dart';
import 'results.dart';

enum genderType { Female, Male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.Male;
                      });
                    },
                    colour: selectedGender == genderType.Male
                        ? kactiveColor
                        : kinactiveColor,
                    cardChild: iconContent(
                      gender: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.Female;
                      });
                    },
                    colour: selectedGender == genderType.Female
                        ? kactiveColor
                        : kinactiveColor,
                    cardChild: iconContent(
                      gender: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
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
                  child: ReusableCard(colour: kcontainerDefaultColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',style: ktextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: klabelTextStyle,
                          ),
                          Text(
                            ' cm',
                            style: ktextStyle,
                          )
                        ],
                      ),
                      SliderTheme(

                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kgreyColor,
                          overlayColor: Color(0x29EB1555),
                          thumbColor: kbottomContainerColor ,
                          trackHeight: 1,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 80,
                          max: 300,
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
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kcontainerDefaultColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: ktextStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic ,
                          children: [
                            Text(
                            weight.toString(),
                            style: klabelTextStyle,
                          ),
                          Text(
                            'kg',
                            style: ktextStyle,
                          )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              ifPressed: (){
                                setState(() {

                                  weight > 20? weight-- : print('minimum weight reach');

                                });
                              },
                              iconSize: 30,
                              symbol: Icons.remove,
                            ),
                            RoundedIconButton(
                              ifPressed: (){
                                setState(() {

                                  weight < 500 ? weight++ : print('maximum weight reach');

                                });
                              },
                              symbol: Icons.add,
                              iconSize: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: kcontainerDefaultColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                        'AGE',
                        style: ktextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: klabelTextStyle,
                          ),
                          Text(
                            'yrs',
                            style: ktextStyle,
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            ifPressed: (){
                              setState(() {

                                age > 10? age-- : print('minimum age reach');

                              });
                            },
                            iconSize: 30,
                            symbol: Icons.remove,
                          ),
                          RoundedIconButton(
                            ifPressed: (){
                              setState(() {

                                age < 100 ? age++ : print('maximum age reach');

                              });
                            },
                            symbol: Icons.add,
                            iconSize: 30,
                          ),
                        ],
                      )
                      ],
                  ),

                ),
                ),
              ],
            ),
          ),
          ReusableButton(
            onPress: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Results(
                calcResult: calc.calculateBMI(),
                bmiResult: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
            buttonChild: Text('CALCULATE',
            style: kbottomContainerTextStyle,),
          )
        ],
      ),
    );
  }
}



