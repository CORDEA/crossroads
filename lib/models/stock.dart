import 'package:flutter/foundation.dart';

class StockModel extends ChangeNotifier {
  double _currentPrice;
  double _purchasePrice;
  double _purchaseFeeRate;
  double _saleFeeRate;

  double _gain;

  void updateCurrentPrice(String currentPrice) {
    _currentPrice = double.tryParse(currentPrice) ?? 0;
  }

  void updatePurchasePrice(String purchasePrice) {
    _purchasePrice = double.tryParse(purchasePrice) ?? 0;
  }

  void updatePurchaseFeeRate(String feeRate) {
    _purchaseFeeRate = double.tryParse(feeRate) ?? 0;
  }

  void updateSaleFeeRate(String feeRate) {
    _saleFeeRate = double.tryParse(feeRate) ?? 0;
  }

  void calculate() {
    var source = _purchasePrice * (1 + _purchaseFeeRate);
    var target = _currentPrice * (1 + _saleFeeRate);

    _gain = target - source;
    notifyListeners();
  }
}
