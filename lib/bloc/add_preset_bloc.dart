import 'package:crossroads/models/preset.dart';
import 'package:crossroads/repositories/preset_repository.dart';
import 'package:flutter/foundation.dart';

class AddPresetBloc extends ChangeNotifier {
  final PresetRepository _repository;

  String _title = '';
  double _purchaseFeeRate = 0;
  bool _hasPurchaseFeeRateError = false;
  double _saleFeeRate = 0;
  bool _hasSaleFeeRateError = false;

  bool _completed = false;

  AddPresetBloc(this._repository);

  bool get completed => _completed;

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

    _repository.insert(Preset(_title, _purchaseFeeRate, _saleFeeRate)).then(
      (value) {
        _completed = true;
        notifyListeners();
      },
    );
  }
}
