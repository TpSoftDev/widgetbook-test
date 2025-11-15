import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from the main app (package name = pubspec name of main app)
import 'package:widgetbook_test/widgets/custom_button.dart';

// INTERACTIVE STORY - Change properties with knobs!
@widgetbook.UseCase(name: 'Interactive Button', type: CustomButton)
Widget interactiveButton(BuildContext context) {
  final text = context.knobs.string(
    label: 'Button Text',
    initialValue: 'Click Me',
  );
  
  final colorName = context.knobs.list(
    label: 'Background Color',
    options: ['Blue', 'Green', 'Red', 'Purple', 'Orange'],
    initialOption: 'Blue',
  );
  
  final backgroundColor = {
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Red': Colors.red,
    'Purple': Colors.purple,
    'Orange': Colors.orange,
  }[colorName]!;
  
  final isLoading = context.knobs.boolean(
    label: 'Loading State',
    initialValue: false,
  );
  
  final isDisabled = context.knobs.boolean(
    label: 'Disabled',
    initialValue: false,
  );
  
  return Center(
    child: CustomButton(
      text: text,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      onPressed: isDisabled ? null : () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Primary Button', type: CustomButton)
Widget primaryButton(BuildContext context) {
  return Center(
    child: CustomButton(text: 'Click Me', onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'Green Button', type: CustomButton)
Widget greenButton(BuildContext context) {
  return Center(
    child: CustomButton(
      text: 'Save',
      backgroundColor: Colors.green,
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Loading State', type: CustomButton)
Widget loadingButton(BuildContext context) {
  return const Center(
    child: CustomButton(text: 'Processing...', isLoading: true),
  );
}

@widgetbook.UseCase(name: 'Loading with Custom Color', type: CustomButton)
Widget loadingCustomColorButton(BuildContext context) {
  return const Center(
    child: CustomButton(
      text: 'Saving...',
      backgroundColor: Colors.green,
      isLoading: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: CustomButton)
Widget disabledButton(BuildContext context) {
  return const Center(
    child: CustomButton(text: 'Disabled', onPressed: null),
  );
}
