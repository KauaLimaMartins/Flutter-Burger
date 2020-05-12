import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import './input.widget.dart';
import './loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var burguerKingController = new MoneyMaskedTextController();
  var mcDonaldsController = new MoneyMaskedTextController();
  var bobsController = new MoneyMaskedTextController();
  var subwayController = new MoneyMaskedTextController();

  bool loading = false;
  Function submitFunction;

  SubmitForm({
    @required this.burguerKingController,
    @required this.mcDonaldsController,
    @required this.bobsController,
    @required this.subwayController,
    @required this.loading,
    @required this.submitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Burguer King",
            controller: burguerKingController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "McDonald's",
            controller: mcDonaldsController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Subway",
            controller: subwayController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Bob's",
            controller: bobsController,
          ),
        ),
        LoadingButton(
          label: 'Comparar',
          loading: loading,
          invertColors: false,
          action: submitFunction,
        ),
      ],
    );
  }
}
