import 'package:crossroads/models/stock.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _CalculatorTextField(
                text: 'Purchase price',
                onChanged: (text) {
                  context.read<StockModel>().updatePurchasePrice(text);
                },
              ),
              SizedBox(height: 16),
              _CalculatorTextField(
                text: 'Current price',
                onChanged: (text) {
                  context.read<StockModel>().updateCurrentPrice(text);
                },
              ),
              SizedBox(height: 16),
              _CalculatorTextField(
                text: 'Purchase fee rate',
                onChanged: (text) {
                  context.read<StockModel>().updatePurchaseFeeRate(text);
                },
              ),
              SizedBox(height: 16),
              _CalculatorTextField(
                text: 'Sale fee rate',
                onChanged: (text) {
                  context.read<StockModel>().updateSaleFeeRate(text);
                },
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: const Text(
                    'Calculate',
                  ),
                  onPressed: () {
                    context.read<StockModel>().calculate();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalculatorTextField extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;

  _CalculatorTextField({
    Key key,
    @required this.text,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
      ),
      onChanged: onChanged,
    );
  }
}
