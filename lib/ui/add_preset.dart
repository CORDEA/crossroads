import 'package:crossroads/bloc/add_preset_bloc.dart';
import 'package:crossroads/ui/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPreset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var completed = context.select<AddPresetBloc, bool>(
      (value) => value.completed,
    );
    Future.microtask(() {
      if (completed) {
        Navigator.pop(context);
      }
    });
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
              errorText: null,
              onChanged: (text) {
                context.read<AddPresetBloc>().onTitleChanged(text);
              },
            ),
            const SizedBox(height: 16),
            Selector<AddPresetBloc, bool>(
              selector: (_, bloc) => bloc.hasPurchaseFeeRateError,
              builder: (_, hasError, __) => OutlinedTextField(
                text: 'Purchase fee rate',
                errorText: hasError ? 'Illegal value' : null,
                onChanged: (text) {
                  context.read<AddPresetBloc>().onPurchaseFeeRateChanged(text);
                },
              ),
            ),
            const SizedBox(height: 16),
            Selector<AddPresetBloc, bool>(
              selector: (_, bloc) => bloc.hasSaleFeeRateError,
              builder: (_, hasError, __) => OutlinedTextField(
                text: 'Sale fee rate',
                errorText: hasError ? 'Illegal value' : null,
                onChanged: (text) {
                  context.read<AddPresetBloc>().onSaleFeeRateChanged(text);
                },
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: const Text('Add'),
                onPressed: () {
                  context.read<AddPresetBloc>().submit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
