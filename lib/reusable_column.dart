import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0, color: Color(0XFF8D8E98),
);

class ReusableColumn extends StatelessWidget {

  final IconData icon;
  final String label;

  const ReusableColumn({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: labelTextStyle,
        ),
      ],
    );
  }
}