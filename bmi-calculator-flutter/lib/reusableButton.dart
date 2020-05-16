import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableButton extends StatelessWidget {

  final Function onPress;
  final Widget buttonChild;
  ReusableButton({@required this.onPress, this.buttonChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: buttonChild),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}