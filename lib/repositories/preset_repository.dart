import 'package:crossroads/models/preset.dart';

class PresetRepository {
  final List<Preset> _presets = [];

  Future<List<Preset>> findAll() => Future.delayed(
        Duration(milliseconds: 200),
        () => _presets,
      );

  Future insert(Preset preset) {
    _presets.add(preset);
    return Future.delayed(Duration(milliseconds: 200));
  }
}
