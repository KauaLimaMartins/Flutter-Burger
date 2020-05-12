import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  String label = '';
  bool loading = false;
  bool invertColors = false;
  Function action;

  LoadingButton({
    @required this.label,
    @required this.loading,
    @required this.invertColors,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color:
                  invertColors ? Theme.of(context).primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: action,
              child: Text(
                label,
                style: TextStyle(
                  color: invertColors
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontFamily: 'Roboto',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
