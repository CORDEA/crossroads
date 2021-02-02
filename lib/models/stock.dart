import 'package:flutter/foundation.dart';

class StockModel extends ChangeNotifier {
  double _currentPrice;
  double _purchasePrice;
  double _feeRate;

  double _gain;

  void updateCurrentPrice(String currentPrice) {
    _currentPrice = double.tryParse(currentPrice) ?? 0;
  }

  void updatePurchasePrice(String purchasePrice) {
    _purchasePrice = double.tryParse(purchasePrice) ?? 0;
  }

  void updateFeeRate(String feeRate) {
    _feeRate = double.tryParse(feeRate) ?? 0;
  }

  void calculate() {
    var source = _purchasePrice * (1 + _feeRate);
    var target = _currentPrice * (1 + _feeRate);

    _gain = target - source;
    notifyListeners();
  }
}
