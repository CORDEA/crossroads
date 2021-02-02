import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class StockModel extends ChangeNotifier {
  static final NumberFormat _formatter = NumberFormat('#,###.0#', 'en_US');

  double _currentPrice;
  double _purchasePrice;
  double _purchaseFeeRate;
  double _saleFeeRate;

  double _gain = 0;

  String get gain => _formatter.format(_gain);

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
