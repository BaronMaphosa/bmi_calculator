import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'reusableButton.dart';
class Results extends StatelessWidget {
  Results({this.bmiResult, this.calcResult, this.interpretation});

  final String calcResult;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Your Results'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results',
                style: kbottomContainerTextStyle,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left:10, right:10),
              child: ReusableCard(
                colour: kcontainerDefaultColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( bmiResult,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0XFF24D876),
                    ),),
                    Text(calcResult,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    )
                    ),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableButton(
              onPress: (){
                Navigator.pop(context);
              },
              buttonChild: Text('RE-CALCULATE',
              style: kbottomContainerTextStyle,),
            ),
          )
        ],
      )
    );
  }
}
