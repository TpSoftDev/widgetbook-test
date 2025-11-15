# 🚀 Widgetbook Quick Reference Card

> Ultra-condensed reference for experienced users

---

## ⚡ Setup (3 minutes)

```bash
flutter create widgetbook --empty && cd widgetbook
flutter pub add widgetbook widgetbook_annotation dev:widgetbook_generator dev:build_runner
```

```yaml
# pubspec.yaml
name: widgetbook_workspace
dependencies:
  widgetbook: ^3.19.0
  widgetbook_annotation: ^3.8.0
  your_app: {path: ../}
dev_dependencies: {build_runner:, widgetbook_generator: ^3.19.0}
```

```dart
// lib/main.dart
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'main.directories.g.dart';

void main() => runApp(const WidgetbookApp());

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});
  @override
  Widget build(BuildContext context) => Widgetbook.material(directories: directories);
}
```

```bash
dart run build_runner build -d && flutter run
```

---

## 📦 Use-Case Syntax

```dart
@widgetbook.UseCase(name: 'Primary', type: Button)
Widget primaryButton(BuildContext context) {
  return Button(
    text: context.knobs.string(label: 'Text', initialValue: 'Click'),
    enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
  );
}
```

---

## 🎛️ All Knobs at a Glance

```dart
context.knobs.string(label: 'Text', initialValue: 'Hello')
context.knobs.boolean(label: 'Enabled', initialValue: true)
context.knobs.int.slider(label: 'Count', initialValue: 5, min: 0, max: 10)
context.knobs.double.slider(label: 'Size', initialValue: 1.0, min: 0, max: 2)
context.knobs.list(label: 'Type', options: ['A', 'B'], initialOption: 'A')
context.knobs.color(label: 'Color', initialValue: Colors.blue)
context.knobs.dateTime(label: 'Date', initialValue: DateTime.now())
context.knobs.duration(label: 'Duration', initialValue: Duration(seconds: 1))
context.knobs.nullableString(label: 'Optional', initialValue: null)
```

---

## 🔌 Essential Addons

```dart
Widgetbook.material(
  directories: directories,
  addons: [
    DeviceFrameAddon(devices: [Devices.ios.iPhone13, Devices.android.pixel4]),
    MaterialThemeAddon(themes: [
      WidgetbookTheme(name: 'Light', data: ThemeData.light()),
      WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
    ]),
    TextScaleAddon(scales: [1.0, 1.5, 2.0]),
    LocalizationAddon(locales: [Locale('en'), Locale('es')]),
    AlignmentAddon(),
  ],
)
```

**⚠️ Addon Order:** First = Outermost, Last = Innermost

---

## 🏗️ Custom App Builder

```dart
Widgetbook(
  directories: directories,
  appBuilder: (context, child) => MaterialApp(home: child),
)
```

---

## 🏢 Monorepo

```yaml
# widgetbook/pubspec.yaml
dependencies:
  design_system: {path: ../packages/design_system}
  my_app: {path: ../my_app}
```

```yaml
# melos.yaml
packages: [apps/**, packages/**, widgetbook/]
```

```bash
melos bootstrap
melos run widgetbook:build
```

---

## 🐛 Quick Fixes

| Problem | Solution |
|---------|----------|
| Generated file missing | `dart run build_runner build -d` |
| Conflicting outputs | `dart run build_runner build --delete-conflicting-outputs` |
| Hot reload not working | Use `dart run build_runner watch -d` |
| UseCase not showing | Check annotation import & rebuild |
| Addon not working | Check order (first = outermost) |

---

## 📋 Commands

```bash
# Build
dart run build_runner build -d              # Build once
dart run build_runner watch -d              # Watch mode
dart run build_runner clean                 # Clean
dart run build_runner build --delete-conflicting-outputs  # Force

# Run
flutter run                                 # Default
flutter run -d chrome                       # Web
flutter run -d macos                        # Desktop
```

---

## 🎨 Common Patterns

### Multiple States
```dart
@widgetbook.UseCase(name: 'Loading', type: Card)
Widget loading(BuildContext context) => Card(isLoading: true);

@widgetbook.UseCase(name: 'Error', type: Card)
Widget error(BuildContext context) => Card(error: 'Failed');

@widgetbook.UseCase(name: 'Success', type: Card)
Widget success(BuildContext context) => Card(data: mockData);
```

### Mock Lists
```dart
@widgetbook.UseCase(name: 'User List', type: UserList)
Widget userList(BuildContext context) {
  final count = context.knobs.int.slider(label: 'Count', initialValue: 5, min: 0, max: 20);
  return UserList(users: List.generate(count, (i) => User(id: i, name: 'User $i')));
}
```

### Edge Cases
```dart
@widgetbook.UseCase(name: 'Long Text', type: Label)
Widget longText(BuildContext context) => 
  Label('Very long text that might overflow the container');

@widgetbook.UseCase(name: 'Empty', type: Label)
Widget empty(BuildContext context) => Label('');
```

---

## ✅ Best Practices Checklist

- [ ] One purpose per use-case
- [ ] Test edge cases (empty, long text, loading, error)
- [ ] Use descriptive names
- [ ] Use addons for global config (not manual wrapping)
- [ ] Keep knobs to 3-5 per use-case
- [ ] Organize by atomic design (atoms/molecules/organisms)
- [ ] Document complex widgets
- [ ] Run in watch mode during development

---

## 🔗 Links

- 📖 [Full Cheat Sheet](./WIDGETBOOK_CHEATSHEET.md)
- 🌐 [Docs](https://docs.widgetbook.io)
- 💻 [GitHub](https://github.com/widgetbook/widgetbook)
- 🎮 [Demo](https://demo.widgetbook.io)

---

**💡 Hot Tip:** Keep this open while coding. Ctrl+F to find what you need instantly.


