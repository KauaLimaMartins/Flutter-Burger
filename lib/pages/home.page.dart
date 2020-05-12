import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/logo.widget.dart';
import '../widgets/submit-form.widget.dart';
import '../widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.red;

  var _burguerKingController = new MoneyMaskedTextController();
  var _mcDonaldsController = new MoneyMaskedTextController();
  var _bobsController = new MoneyMaskedTextController();
  var _subwayController = new MoneyMaskedTextController();

  bool _loading = false;
  bool _completed = false;
  String _resultTitle = "ERROR";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    result: _resultTitle,
                    reset: this.reset,
                  )
                : SubmitForm(
                    burguerKingController: _burguerKingController,
                    mcDonaldsController: _mcDonaldsController,
                    bobsController: _bobsController,
                    subwayController: _subwayController,
                    loading: _loading,
                    submitFunction: this.compare,
                  ),
          ],
        ),
      ),
    );
  }

  Future compare() {
    double burguerKing = double.parse(
            _burguerKingController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;

    double mcDonalds = double.parse(
            _mcDonaldsController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;

    double subway = double.parse(
            _subwayController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;

    double bobs =
        double.parse(_bobsController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;

    setState(() {
      _color = Colors.redAccent;
      _loading = true;
      _completed = false;
    });

    return Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          if (burguerKing <= mcDonalds &&
              burguerKing <= subway &&
              burguerKing <= bobs) {
            _resultTitle = "Burguer King";
          } else if (mcDonalds <= burguerKing &&
              mcDonalds <= subway &&
              mcDonalds <= bobs) {
            _resultTitle = "McDonald's";
          } else if (subway <= burguerKing &&
              subway <= mcDonalds &&
              subway <= bobs) {
            _resultTitle = "Subway";
          } else if (bobs <= burguerKing &&
              bobs <= subway &&
              bobs <= mcDonalds) {
            _resultTitle = "Bob's";
          }

          _loading = false;
          _completed = true;
        });
      },
    );
  }

  reset() {
    setState(() {
      _burguerKingController = new MoneyMaskedTextController();
      _mcDonaldsController = new MoneyMaskedTextController();
      _bobsController = new MoneyMaskedTextController();
      _subwayController = new MoneyMaskedTextController();

      _loading = false;
      _completed = false;
      _resultTitle = "ERROR";

      _color = Colors.red;
    });
  }
}
