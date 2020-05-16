import 'package:flutter/material.dart';
import 'constants.dart';


// ignore: camel_case_types
class iconContent extends StatelessWidget {
  final String gender;
  final IconData icon;
  iconContent({this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(
          height: 10,
        ),
        Text('$gender',style:(ktextStyle),
        )
      ],
    );
  }
}
