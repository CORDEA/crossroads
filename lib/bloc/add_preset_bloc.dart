import 'package:crossroads/repositories/preset_repository.dart';
import 'package:flutter/foundation.dart';

class AddPresetBloc extends ChangeNotifier {
  final PresetRepository _repository;

  String _title;
  double _purchaseFeeRate;
  bool _hasPurchaseFeeRateError;
  double _saleFeeRate;
  bool _hasSaleFeeRateError;

  AddPresetBloc(this._repository);

  void onTitleChanged(String value) {
    _title = value;
  }

  void onPurchaseFeeRateChanged(String value) {
    var v = double.tryParse(value);
    _hasPurchaseFeeRateError = v == null;
    _purchaseFeeRate = v ?? 0;
    notifyListeners();
  }

  void onSaleFeeRateChanged(String value) {
    var v = double.tryParse(value);
    _hasSaleFeeRateError = v == null;
    _saleFeeRate = v ?? 0;
    notifyListeners();
  }

  void submit() {
    if (_hasPurchaseFeeRateError || _hasSaleFeeRateError) {
      return;
    }
  }
}
