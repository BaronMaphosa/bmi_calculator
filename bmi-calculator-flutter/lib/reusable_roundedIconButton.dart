import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData symbol;
  final Function ifPressed;
  final double iconSize;

  RoundedIconButton({this.symbol, @required this.ifPressed, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ifPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        symbol,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}

