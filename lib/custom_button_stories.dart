import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from the main app (package name = pubspec name of main app)
import 'package:widgetbook_test/widgets/custom_button.dart';

@widgetbook.UseCase(name: 'Primary Button', type: CustomButton)
Widget primaryButton(BuildContext context) {
  return CustomButton(text: 'Click Me', onPressed: () {});
}

@widgetbook.UseCase(name: 'Green Button', type: CustomButton)
Widget greenButton(BuildContext context) {
  return CustomButton(
    text: 'Save',
    backgroundColor: Colors.green,
    onPressed: () {},
  );
}

@widgetbook.UseCase(name: 'Loading State', type: CustomButton)
Widget loadingButton(BuildContext context) {
  return const CustomButton(text: 'Processing...', isLoading: true);
}

@widgetbook.UseCase(name: 'Loading with Custom Color', type: CustomButton)
Widget loadingCustomColorButton(BuildContext context) {
  return const CustomButton(
    text: 'Saving...', 
    backgroundColor: Colors.green,
    isLoading: true,
  );
}

@widgetbook.UseCase(name: 'Disabled', type: CustomButton)
Widget disabledButton(BuildContext context) {
  return const CustomButton(text: 'Disabled', onPressed: null);
}
