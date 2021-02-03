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
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasPurchasePriceError,
                builder: (_, hasError, __) => _CalculatorTextField(
                  text: 'Purchase price',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updatePurchasePrice,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasCurrentPriceError,
                builder: (_, hasError, __) => _CalculatorTextField(
                  text: 'Current price',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updateCurrentPrice,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasPurchaseFeeRateError,
                builder: (_, hasError, __) => _CalculatorTextField(
                  text: 'Purchase fee rate',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updatePurchaseFeeRate,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasSaleFeeRateError,
                builder: (_, hasError, __) => _CalculatorTextField(
                  text: 'Sale fee rate',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updateSaleFeeRate,
                ),
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
              SizedBox(height: 32),
              const Align(
                alignment: Alignment.center,
                child: _CalculatorResult(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CalculatorTextField extends StatelessWidget {
  final String text;
  final String errorText;
  final ValueChanged<String> onChanged;

  _CalculatorTextField({
    Key key,
    @required this.text,
    @required this.errorText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
        errorText: errorText,
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class _CalculatorResult extends StatelessWidget {
  const _CalculatorResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gain = context.select<StockModel, String>((value) => value.gain);
    return Text(
      gain,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
