class Preset {
  final String _title;
  final double _purchaseFeeRate;
  final double _saleFeeRate;

  Preset(this._title, this._purchaseFeeRate, this._saleFeeRate);

  String get title => _title;

  double get purchaseFeeRate => _purchaseFeeRate;

  double get saleFeeRate => _saleFeeRate;
}
