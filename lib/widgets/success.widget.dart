import 'package:flutter/material.dart';

import './loading-button.widget.dart';

class Success extends StatelessWidget {
  String result = '';
  Function reset;

  Success({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text(
            "Compensa comer no $result",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: 'Big Shoulders Display',
            ),
            textAlign: TextAlign.center,
          ),
          LoadingButton(
            label: 'Comparar Novamente',
            loading: false,
            invertColors: true,
            action: reset,
          ),
        ],
      ),
    );
  }
}
