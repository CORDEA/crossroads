import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String text;
  final String errorText;
  final ValueChanged<String> onChanged;

  OutlinedTextField({
    Key key,
    @required this.text,
    @required this.errorText,
    @required this.onChanged,
  })  : assert(text != null),
        assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
        errorText: errorText,
      ),
      onChanged: onChanged,
    );
  }
}
