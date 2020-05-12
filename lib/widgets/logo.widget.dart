import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Image.asset(
          "assets/images/burguer.png",
          height: 130,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Burguer Comparator",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
