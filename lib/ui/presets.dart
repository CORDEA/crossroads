import 'package:flutter/material.dart';

class Presets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presets'),
      ),
      body: ListView(
        children: [
          _PresetsItem(),
        ],
      ),
    );
  }
}

class _PresetsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            '',
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
