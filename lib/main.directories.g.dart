// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/custom_button_stories.dart'
    as _widgetbook_workspace_custom_button_stories;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'CustomButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder: _widgetbook_workspace_custom_button_stories.disabledButton,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Green Button',
            builder: _widgetbook_workspace_custom_button_stories.greenButton,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Loading State',
            builder: _widgetbook_workspace_custom_button_stories.loadingButton,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Primary Button',
            builder: _widgetbook_workspace_custom_button_stories.primaryButton,
          ),
        ],
      ),
    ],
  ),
];
