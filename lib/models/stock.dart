import 'package:flutter/foundation.dart';

class StockModel extends ChangeNotifier {
  String _currentPrice;
  String _purchasePrice;
  String _feeRate;

  void updateCurrentPrice(String currentPrice) {
    _currentPrice = currentPrice;
  }

  void updatePurchasePrice(String purchasePrice) {
    _purchasePrice = purchasePrice;
  }

  void updateFeeRate(String feeRate) {
    _feeRate = feeRate;
  }

  void calculate() {
    // TODO
  }
}
