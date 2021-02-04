import 'package:crossroads/bloc/preset_bloc.dart';
import 'package:crossroads/models/preset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Presets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PresetBloc>().update();
    return Scaffold(
      appBar: AppBar(
        title: Text('Presets'),
      ),
      body: _PresetsList(),
    );
  }
}

class _PresetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var length = context.select<PresetBloc, int>(
      (value) => value.presets.length,
    );
    return ListView.builder(
      itemBuilder: (context, index) => _PresetsItem(index: index),
      itemCount: length,
    );
  }
}

class _PresetsItem extends StatelessWidget {
  final int index;

  _PresetsItem({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<PresetBloc, Preset>(
      (value) => value.presets[index],
    );
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      constraints: BoxConstraints(
        minHeight: 72,
        minWidth: double.infinity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            '',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
