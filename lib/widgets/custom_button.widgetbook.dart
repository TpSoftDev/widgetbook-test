import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'custom_button.dart';

/// This file contains "stories" for the CustomButton widget
/// Stories show different states/variations of your widget

// Story 1: A basic primary button
@widgetbook.UseCase(name: 'Primary Button', type: CustomButton)
Widget buildPrimaryButton(BuildContext context) {
  return CustomButton(
    text: 'Click Me',
    onPressed: () {
      print('Button clicked!');
    },
  );
}

// Story 2: A button with custom color
@widgetbook.UseCase(name: 'Green Button', type: CustomButton)
Widget buildGreenButton(BuildContext context) {
  return CustomButton(
    text: 'Save',
    backgroundColor: Colors.green,
    onPressed: () {
      print('Save clicked!');
    },
  );
}

// Story 3: A loading button (shows spinner)
@widgetbook.UseCase(name: 'Loading State', type: CustomButton)
Widget buildLoadingButton(BuildContext context) {
  return const CustomButton(text: 'Processing...', isLoading: true);
}

// Story 4: A disabled button (no action)
@widgetbook.UseCase(name: 'Disabled', type: CustomButton)
Widget buildDisabledButton(BuildContext context) {
  return const CustomButton(
    text: 'Disabled',
    onPressed: null, // null = disabled
  );
}
