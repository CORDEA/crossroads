import 'package:crossroads/models/preset.dart';
import 'package:crossroads/repositories/preset_repository.dart';
import 'package:flutter/foundation.dart';

class PresetBloc extends ChangeNotifier {
  final PresetRepository _repository;
  List<Preset> _presets = [];

  PresetBloc(this._repository);

  List<Preset> get presets => _presets;

  void update() {
    _repository.findAll().then((value) {
      _presets = value;
      notifyListeners();
    }).catchError(() {
      _presets = [];
      notifyListeners();
    });
  }
}
