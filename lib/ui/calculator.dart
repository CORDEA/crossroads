import 'package:crossroads/models/stock.dart';
import 'package:crossroads/ui/outlined_text_field.dart';
import 'package:crossroads/ui/presets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crossroads'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasPurchasePriceError,
                builder: (_, hasError, __) => OutlinedTextField(
                  text: 'Purchase price',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updatePurchasePrice,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasCurrentPriceError,
                builder: (_, hasError, __) => OutlinedTextField(
                  text: 'Current price',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updateCurrentPrice,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasPurchaseFeeRateError,
                builder: (_, hasError, __) => OutlinedTextField(
                  text: 'Purchase fee rate',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updatePurchaseFeeRate,
                ),
              ),
              SizedBox(height: 16),
              Selector<StockModel, bool>(
                selector: (_, model) => model.hasSaleFeeRateError,
                builder: (_, hasError, __) => OutlinedTextField(
                  text: 'Sale fee rate',
                  errorText: hasError ? 'Illegal value' : null,
                  onChanged: context.read<StockModel>().updateSaleFeeRate,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    child: const Text(
                      'Presets',
                    ),
                    onPressed: () {
                      Navigator.of(context).push(Presets.route());
                    },
                  ),
                  SizedBox(width: 16),
                  RaisedButton(
                    child: const Text(
                      'Calculate',
                    ),
                    onPressed: () {
                      context.read<StockModel>().calculate();
                    },
                  ),
                ],
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
