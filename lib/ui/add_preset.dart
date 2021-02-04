import 'package:crossroads/ui/outlined_text_field.dart';
import 'package:flutter/material.dart';

class AddPreset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add preset'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            OutlinedTextField(
              text: 'Title',
              errorText: '',
              onChanged: (text) {},
            ),
            const SizedBox(height: 16),
            OutlinedTextField(
              text: 'Purchase fee rate',
              errorText: '',
              onChanged: (text) {},
            ),
            const SizedBox(height: 16),
            OutlinedTextField(
              text: 'Sale fee rate',
              errorText: '',
              onChanged: (text) {},
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: const Text('Add'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
