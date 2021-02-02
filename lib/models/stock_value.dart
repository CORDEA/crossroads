import 'package:flutter/foundation.dart';

class StockValueModel {
  double _value = 0;
  bool _hasError = false;

  double get value => _value;

  bool get hasError => _hasError;

  void update(String rawValue) {
    var v = double.tryParse(rawValue);
    _hasError = v == null;
    _value = v ?? 0;
  }
}
