import 'package:crossroads/models/stock_value.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class StockModel extends ChangeNotifier {
  static final NumberFormat _formatter = NumberFormat('#,###.0#', 'en_US');

  final StockValueModel _currentPrice = StockValueModel();
  final StockValueModel _purchasePrice = StockValueModel();
  final StockValueModel _purchaseFeeRate = StockValueModel();
  final StockValueModel _saleFeeRate = StockValueModel();

  double _gain = 0;

  bool get hasCurrentPriceError => _currentPrice.hasError;

  bool get hasPurchasePriceError => _purchasePrice.hasError;

  bool get hasPurchaseFeeRateError => _purchaseFeeRate.hasError;

  bool get hasSaleFeeRateError => _saleFeeRate.hasError;

  String get gain => _formatter.format(_gain);

  void updateCurrentPrice(String currentPrice) {
    _currentPrice.update(currentPrice);
    notifyListeners();
  }

  void updatePurchasePrice(String purchasePrice) {
    _purchasePrice.update(purchasePrice);
    notifyListeners();
  }

  void updatePurchaseFeeRate(String feeRate) {
    _purchaseFeeRate.update(feeRate);
    notifyListeners();
  }

  void updateSaleFeeRate(String feeRate) {
    _saleFeeRate.update(feeRate);
    notifyListeners();
  }

  void calculate() {
    if (_currentPrice.hasError ||
        _purchasePrice.hasError ||
        _purchaseFeeRate.hasError ||
        _saleFeeRate.hasError) {
      return;
    }
    var source = _purchasePrice.value * (1 + _purchaseFeeRate.value);
    var target = _currentPrice.value * (1 + _saleFeeRate.value);

    _gain = target - source;
    notifyListeners();
  }
}
