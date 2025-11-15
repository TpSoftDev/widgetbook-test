# 📚 Widgetbook Cheat Sheet

> **Quick Reference Guide for Flutter Widgetbook**  
> Version: 3.19+ | Last Updated: October 2024

---

## 📑 Table of Contents

1. [Quick Start](#-quick-start)
2. [Installation & Setup](#-installation--setup)
3. [Creating Use-Cases](#-creating-use-cases)
4. [Knobs (Interactive Controls)](#-knobs-interactive-controls)
5. [Addons](#-addons)
6. [Configuration](#-configuration)
7. [Monorepo Setup](#-monorepo-setup)
8. [Common Patterns](#-common-patterns)
9. [Troubleshooting](#-troubleshooting)
10. [Best Practices](#-best-practices)

---

## 🚀 Quick Start

### 30-Second Setup

```bash
# 1. Create widgetbook project
flutter create widgetbook --empty

# 2. Add dependencies
cd widgetbook
flutter pub add widgetbook widgetbook_annotation dev:widgetbook_generator dev:build_runner
```

```yaml
# 3. Edit widgetbook/pubspec.yaml
name: widgetbook_workspace  # Rename to avoid conflicts

dependencies:
  widgetbook: ^3.19.0
  widgetbook_annotation: ^3.8.0
  your_app:
    path: ../  # Link to your main app

dev_dependencies:
  build_runner: any
  widgetbook_generator: ^3.19.0
```

```dart
// 4. Create widgetbook/lib/main.dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';  // Will be generated

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
    );
  }
}
```

```bash
# 5. Generate code & run
dart run build_runner build -d
flutter run
```

---

## 📦 Installation & Setup

### Project Structure

```
your_app/
├── lib/
│   └── main.dart
├── pubspec.yaml
└── widgetbook/                    # Your Widgetbook app
    ├── lib/
    │   ├── main.dart              # Widgetbook entry point
    │   ├── main.directories.g.dart  # Auto-generated
    │   └── button.dart            # Use-case files
    └── pubspec.yaml
```

### Full Dependencies

```yaml
name: widgetbook_workspace

dependencies:
  flutter:
    sdk: flutter
  widgetbook: ^3.19.0
  widgetbook_annotation: ^3.8.0
  your_app:
    path: ../

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: any
  widgetbook_generator: ^3.19.0
```

### Build Commands

```bash
# One-time build
dart run build_runner build -d

# Watch mode (rebuilds on file changes)
dart run build_runner watch -d

# Clean build
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

---

## 🎯 Creating Use-Cases

### Basic Use-Case

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:your_app/widgets/cool_button.dart';

@widgetbook.UseCase(
  name: 'Primary',        // Name shown in UI
  type: CoolButton,       // Widget type
)
Widget buildPrimaryButton(BuildContext context) {
  return CoolButton(
    text: 'Click Me',
    onPressed: () {},
  );
}
```

### Multiple Use-Cases for One Widget

```dart
// Primary Button
@widgetbook.UseCase(name: 'Primary', type: Button)
Widget primaryButton(BuildContext context) {
  return Button(text: 'Primary', state: ButtonState.primary);
}

// Secondary Button
@widgetbook.UseCase(name: 'Secondary', type: Button)
Widget secondaryButton(BuildContext context) {
  return Button(text: 'Secondary', state: ButtonState.secondary);
}

// Disabled Button
@widgetbook.UseCase(name: 'Disabled', type: Button)
Widget disabledButton(BuildContext context) {
  return Button(text: 'Disabled', state: ButtonState.disabled);
}
```

### Use-Case with Knobs

```dart
@widgetbook.UseCase(name: 'Customizable', type: Button)
Widget customizableButton(BuildContext context) {
  final text = context.knobs.string(
    label: 'Button Text',
    initialValue: 'Click Me',
  );
  
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  
  return Button(
    text: text,
    onPressed: isEnabled ? () {} : null,
  );
}
```

### Screen Use-Cases

```dart
// Pure screen (no dependencies)
@widgetbook.UseCase(name: 'Default', type: ProfileScreen)
Widget profileScreenUseCase(BuildContext context) {
  return ProfileScreen(
    user: User(name: 'John Doe', email: 'john@example.com'),
  );
}

// Screen with mocked data
@widgetbook.UseCase(name: 'Loading State', type: ProfileScreen)
Widget profileLoadingUseCase(BuildContext context) {
  return ProfileScreen(
    isLoading: true,
  );
}
```

---

## 🎛️ Knobs (Interactive Controls)

Knobs let you modify widget properties in real-time through the UI.

### String Knob

```dart
final text = context.knobs.string(
  label: 'Button Text',
  initialValue: 'Click Me',
  description: 'The text displayed on the button',  // Optional tooltip
);
```

### Boolean Knob

```dart
final isEnabled = context.knobs.boolean(
  label: 'Enabled',
  initialValue: true,
);
```

### Number Knobs

```dart
// Integer
final count = context.knobs.int.slider(
  label: 'Item Count',
  initialValue: 5,
  min: 0,
  max: 10,
);

// Double
final opacity = context.knobs.double.slider(
  label: 'Opacity',
  initialValue: 1.0,
  min: 0.0,
  max: 1.0,
);

// Input field (instead of slider)
final fontSize = context.knobs.double.input(
  label: 'Font Size',
  initialValue: 16.0,
);
```

### List/Dropdown Knob

```dart
final size = context.knobs.list(
  label: 'Size',
  options: ['Small', 'Medium', 'Large'],
  initialOption: 'Medium',
);

// With enums
final buttonType = context.knobs.list(
  label: 'Button Type',
  options: ButtonType.values,
  initialOption: ButtonType.primary,
  labelBuilder: (value) => value.toString().split('.').last,
);
```

### Color Knob

```dart
final color = context.knobs.color(
  label: 'Button Color',
  initialValue: Colors.blue,
);
```

### DateTime Knob

```dart
final selectedDate = context.knobs.dateTime(
  label: 'Event Date',
  initialValue: DateTime.now(),
);
```

### Duration Knob

```dart
final animationDuration = context.knobs.duration(
  label: 'Animation Duration',
  initialValue: Duration(milliseconds: 300),
);
```

### Null/Optional Knob

```dart
final icon = context.knobs.nullableString(
  label: 'Icon',
  initialValue: null,
);

// Usage
Icon? iconWidget = icon != null ? Icon(icon) : null;
```

### Complete Example with Multiple Knobs

```dart
@widgetbook.UseCase(name: 'Fully Customizable', type: CustomCard)
Widget customizableCard(BuildContext context) {
  return CustomCard(
    title: context.knobs.string(
      label: 'Title',
      initialValue: 'Card Title',
    ),
    subtitle: context.knobs.string(
      label: 'Subtitle',
      initialValue: 'Card subtitle text',
    ),
    elevation: context.knobs.double.slider(
      label: 'Elevation',
      initialValue: 2.0,
      min: 0,
      max: 24,
    ),
    color: context.knobs.color(
      label: 'Background Color',
      initialValue: Colors.white,
    ),
    showImage: context.knobs.boolean(
      label: 'Show Image',
      initialValue: true,
    ),
    cardType: context.knobs.list(
      label: 'Card Type',
      options: ['Elevated', 'Outlined', 'Filled'],
      initialOption: 'Elevated',
    ),
  );
}
```

---

## 🔌 Addons

Addons wrap all use-cases globally with configurable widgets.

### Common Addons

```dart
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        // IMPORTANT: Order matters! First = outermost
        
        // 1. Device Frame (outermost)
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
            Devices.android.pixel4,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        
        // 2. Theme
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        
        // 3. Text Scale
        TextScaleAddon(
          scales: [1.0, 1.5, 2.0],
          initialScale: 1.0,
        ),
        
        // 4. Localization
        LocalizationAddon(
          locales: [
            Locale('en', 'US'),
            Locale('es', 'ES'),
            Locale('fr', 'FR'),
          ],
          localizationsDelegates: [
            // Your app's localization delegates
          ],
        ),
        
        // 5. Alignment (innermost)
        AlignmentAddon(),
      ],
    );
  }
}
```

### Available Addons

| Addon | Purpose | Example |
|-------|---------|---------|
| `DeviceFrameAddon` | Preview different device screens | iPhone, Android, iPad |
| `MaterialThemeAddon` | Switch between themes | Light, Dark, Custom |
| `CupertinoThemeAddon` | iOS theme switcher | iOS Light/Dark |
| `TextScaleAddon` | Test text scaling | 1.0x, 1.5x, 2.0x |
| `LocalizationAddon` | Test different languages | EN, ES, FR |
| `AlignmentAddon` | Align widgets | Center, Top-Left, etc. |
| `ViewportAddon` | *Deprecated - use DeviceFrameAddon* | - |
| `AccessibilityAddon` | Test accessibility | Screen reader, high contrast |
| `TimeDilationAddon` | Slow down animations | 1x, 2x, 5x slower |
| `InspectorAddon` | Flutter inspector integration | - |
| `GridAddon` | Overlay alignment grid | - |

### Custom Addon

```dart
class CustomWrapperAddon extends WidgetbookAddon<String> {
  CustomWrapperAddon({
    required List<String> options,
    String? initialOption,
  }) : super(
          name: 'Custom Wrapper',
          initialSetting: initialOption ?? options.first,
        );

  @override
  List<Field> get fields => [
        ListField<String>(
          name: 'option',
          initialValue: initialSetting,
          values: options,
        ),
      ];

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    String setting,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: child,
    );
  }
}
```

---

## ⚙️ Configuration

### Root Widget Options

```dart
// MaterialApp (default Material Design)
Widgetbook.material(
  directories: directories,
  addons: [...],
)

// CupertinoApp (iOS style)
Widgetbook.cupertino(
  directories: directories,
  addons: [...],
)

// Custom App
Widgetbook(
  directories: directories,
  addons: [...],
  appBuilder: (context, child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        body: child,
      ),
    );
  },
)
```

### Custom App Builder

```dart
Widgetbook(
  directories: directories,
  appBuilder: (context, child) {
    return Provider(  // Wrap with state management
      providers: [
        // Your providers
      ],
      child: MaterialApp(
        home: child,
      ),
    );
  },
)
```

### Initial Route

```dart
Widgetbook.material(
  directories: directories,
  initialRoute: '?path=widgets/button/primary',  // Deep link to specific use-case
)
```

### Custom Home Widget

```dart
Widgetbook.material(
  directories: directories,
  homeWidget: Center(
    child: Text(
      'Welcome to Our Design System',
      style: TextStyle(fontSize: 24),
    ),
  ),
)
```

---

## 🏢 Monorepo Setup

### Single Widgetbook (Recommended for most cases)

```
monorepo/
├── my_app/
├── packages/
│   ├── design_system/
│   └── core/
└── widgetbook/           # Single Widgetbook for everything
```

```yaml
# widgetbook/pubspec.yaml
name: widgetbook_workspace

dependencies:
  widgetbook: ^3.19.0
  widgetbook_annotation: ^3.8.0
  design_system:
    path: ../packages/design_system
  core:
    path: ../packages/core
  my_app:
    path: ../my_app

dev_dependencies:
  build_runner: any
  widgetbook_generator: ^3.19.0
```

### Melos Setup

```yaml
# melos.yaml (at monorepo root)
name: my_monorepo

packages:
  - apps/**
  - packages/**
  - widgetbook/        # Add widgetbook to Melos

scripts:
  widgetbook:build:
    run: dart run build_runner build -d
    exec:
      concurrency: 1
    packageFilters:
      dirExists: widgetbook
```

```bash
# Bootstrap dependencies
melos bootstrap

# Build Widgetbook
melos run widgetbook:build
```

### Per-Package Widgetbook (Advanced)

```
monorepo/
├── my_app/
│   └── widgetbook/       # App-specific Widgetbook
└── packages/
    └── design_system/
        └── widgetbook/   # Design system Widgetbook
```

---

## 🎨 Common Patterns

### Pattern 1: Button Variants

```dart
// button_use_cases.dart

@widgetbook.UseCase(name: 'Primary', type: AppButton)
Widget primary(BuildContext context) => _buildButton(context, ButtonVariant.primary);

@widgetbook.UseCase(name: 'Secondary', type: AppButton)
Widget secondary(BuildContext context) => _buildButton(context, ButtonVariant.secondary);

@widgetbook.UseCase(name: 'Danger', type: AppButton)
Widget danger(BuildContext context) => _buildButton(context, ButtonVariant.danger);

Widget _buildButton(BuildContext context, ButtonVariant variant) {
  return AppButton(
    text: context.knobs.string(label: 'Text', initialValue: 'Click Me'),
    variant: variant,
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    isDisabled: context.knobs.boolean(label: 'Disabled', initialValue: false),
    onPressed: () {},
  );
}
```

### Pattern 2: Card with Different States

```dart
@widgetbook.UseCase(name: 'Default', type: ProductCard)
Widget defaultCard(BuildContext context) {
  return ProductCard(
    title: 'Product Name',
    price: '\$99.99',
    imageUrl: 'https://picsum.photos/200',
  );
}

@widgetbook.UseCase(name: 'Loading', type: ProductCard)
Widget loadingCard(BuildContext context) {
  return ProductCard(isLoading: true);
}

@widgetbook.UseCase(name: 'Error', type: ProductCard)
Widget errorCard(BuildContext context) {
  return ProductCard(
    error: 'Failed to load product',
  );
}
```

### Pattern 3: Form Fields

```dart
@widgetbook.UseCase(name: 'Text Field', type: AppTextField)
Widget textField(BuildContext context) {
  return AppTextField(
    label: context.knobs.string(label: 'Label', initialValue: 'Email'),
    hint: context.knobs.string(label: 'Hint', initialValue: 'Enter your email'),
    errorText: context.knobs.nullableString(label: 'Error', initialValue: null),
    enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
  );
}
```

### Pattern 4: List with Mock Data

```dart
@widgetbook.UseCase(name: 'User List', type: UserListWidget)
Widget userList(BuildContext context) {
  final itemCount = context.knobs.int.slider(
    label: 'Item Count',
    initialValue: 5,
    min: 0,
    max: 20,
  );
  
  final users = List.generate(
    itemCount,
    (index) => User(
      id: index,
      name: 'User ${index + 1}',
      email: 'user$index@example.com',
    ),
  );
  
  return UserListWidget(users: users);
}
```

### Pattern 5: Theming

```dart
@widgetbook.UseCase(name: 'Themed Card', type: ThemedCard)
Widget themedCard(BuildContext context) {
  // Access current theme from Material/Cupertino addon
  final theme = Theme.of(context);
  
  return ThemedCard(
    backgroundColor: theme.cardColor,
    textColor: theme.textTheme.bodyLarge?.color,
  );
}
```

---

## 🐛 Troubleshooting

### Common Issues & Solutions

#### 1. "Generated file not found"

```bash
# Error: main.directories.g.dart doesn't exist

# Solution:
dart run build_runner build -d
```

#### 2. "Conflicting outputs"

```bash
# Error: conflicting outputs detected

# Solution:
dart run build_runner build --delete-conflicting-outputs
```

#### 3. "Cannot find package"

```yaml
# Error: Cannot find your_app package

# Solution: Check pubspec.yaml
dependencies:
  your_app:
    path: ../  # Make sure path is correct
```

#### 4. "UseCase not showing up"

```dart
// Make sure you have:
// 1. Import annotation
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// 2. Use annotation correctly
@widgetbook.UseCase(name: 'Default', type: MyWidget)
Widget buildMyWidget(BuildContext context) { ... }

// 3. Rebuild
// dart run build_runner build -d
```

#### 5. "Hot reload not working"

```bash
# Use watch mode instead
dart run build_runner watch -d

# Then run app
flutter run
```

#### 6. "Addons not working correctly"

```dart
// Check addon order - first is outermost!
addons: [
  DeviceFrameAddon(...),  // First (outermost)
  ThemeAddon(...),
  AlignmentAddon(),       // Last (innermost)
]
```

#### 7. "Knobs not updating"

```dart
// Make sure you're calling knobs INSIDE the builder function
@widgetbook.UseCase(name: 'Test', type: MyWidget)
Widget test(BuildContext context) {
  // ✅ CORRECT - inside builder
  final text = context.knobs.string(label: 'Text', initialValue: 'Hello');
  return MyWidget(text: text);
}

// ❌ WRONG - outside builder
final text = '...';  // This won't update
```

---

## ✅ Best Practices

### 1. File Organization

```
widgetbook/
├── lib/
│   ├── main.dart
│   ├── main.directories.g.dart
│   ├── atoms/              # Atomic design pattern
│   │   ├── button.dart
│   │   └── icon.dart
│   ├── molecules/
│   │   ├── card.dart
│   │   └── list_item.dart
│   ├── organisms/
│   │   └── navigation_bar.dart
│   └── screens/
│       └── home_screen.dart
```

### 2. Naming Conventions

```dart
// ✅ Good - descriptive names
@widgetbook.UseCase(name: 'Primary Button', type: Button)
@widgetbook.UseCase(name: 'Secondary with Icon', type: Button)
@widgetbook.UseCase(name: 'Loading State', type: ProductCard)

// ❌ Bad - vague names
@widgetbook.UseCase(name: 'Button1', type: Button)
@widgetbook.UseCase(name: 'Test', type: Button)
```

### 3. Use Knobs Wisely

```dart
// ✅ Good - interactive and useful
@widgetbook.UseCase(name: 'Interactive', type: Button)
Widget interactive(BuildContext context) {
  return Button(
    text: context.knobs.string(label: 'Text', initialValue: 'Click Me'),
    isDisabled: context.knobs.boolean(label: 'Disabled', initialValue: false),
  );
}

// ❌ Bad - too many knobs makes it confusing
@widgetbook.UseCase(name: 'Over-engineered', type: Button)
Widget overEngineered(BuildContext context) {
  return Button(
    text: context.knobs.string(...),
    fontSize: context.knobs.double.slider(...),
    padding: context.knobs.double.slider(...),
    margin: context.knobs.double.slider(...),
    borderRadius: context.knobs.double.slider(...),
    // ... 20 more knobs ...
  );
}
```

### 4. Test Edge Cases

```dart
// Test with different text lengths
@widgetbook.UseCase(name: 'Long Text', type: Button)
Widget longText(BuildContext context) {
  return Button(
    text: 'This is a very long button text that might overflow',
  );
}

@widgetbook.UseCase(name: 'Empty Text', type: Button)
Widget emptyText(BuildContext context) {
  return Button(text: '');
}

// Test loading and error states
@widgetbook.UseCase(name: 'Loading', type: ProfileScreen)
Widget loading(BuildContext context) {
  return ProfileScreen(isLoading: true);
}

@widgetbook.UseCase(name: 'Error', type: ProfileScreen)
Widget error(BuildContext context) {
  return ProfileScreen(error: 'Failed to load profile');
}
```

### 5. Document Complex Widgets

```dart
/// Use-case for the ProfileCard widget
/// 
/// This demonstrates:
/// - Different user roles (Admin, User, Guest)
/// - Avatar loading states
/// - Long names that might overflow
@widgetbook.UseCase(name: 'Profile Card', type: ProfileCard)
Widget profileCard(BuildContext context) {
  return ProfileCard(
    name: context.knobs.string(
      label: 'Name',
      initialValue: 'John Doe',
      description: 'Try a very long name to test overflow',
    ),
    role: context.knobs.list(
      label: 'Role',
      options: ['Admin', 'User', 'Guest'],
    ),
  );
}
```

### 6. Keep Use-Cases Simple

```dart
// ✅ Good - one purpose per use-case
@widgetbook.UseCase(name: 'Primary', type: Button)
Widget primary(BuildContext context) => Button.primary();

@widgetbook.UseCase(name: 'Secondary', type: Button)
Widget secondary(BuildContext context) => Button.secondary();

// ❌ Bad - trying to do everything in one use-case
@widgetbook.UseCase(name: 'All Buttons', type: Button)
Widget allButtons(BuildContext context) {
  return Column(
    children: [
      Button.primary(),
      Button.secondary(),
      Button.danger(),
      // This should be separate use-cases
    ],
  );
}
```

### 7. Use Addons for Global Config

```dart
// ✅ Good - use ThemeAddon
Widgetbook.material(
  addons: [
    MaterialThemeAddon(
      themes: [
        WidgetbookTheme(name: 'Light', data: lightTheme),
        WidgetbookTheme(name: 'Dark', data: darkTheme),
      ],
    ),
  ],
)

// ❌ Bad - manually wrapping each use-case
@widgetbook.UseCase(name: 'Button', type: Button)
Widget button(BuildContext context) {
  return Theme(  // Don't do this
    data: ThemeData.dark(),
    child: Button(),
  );
}
```

---

## 🔗 Quick Reference Links

- **Documentation**: [docs.widgetbook.io](https://docs.widgetbook.io)
- **GitHub**: [github.com/widgetbook/widgetbook](https://github.com/widgetbook/widgetbook)
- **Pub.dev**: [pub.dev/packages/widgetbook](https://pub.dev/packages/widgetbook)
- **Demo**: [demo.widgetbook.io](https://demo.widgetbook.io/)
- **Discord**: [discord.gg/zT4AMStAJA](https://discord.gg/zT4AMStAJA)

---

## 🎓 Additional Resources

### VS Code Extension
**Widgetbook Entries Generator** by LeanCode  
[marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=LeanCode.widgetbook-generator)

### Articles
- [Building a Design System in Flutter](https://leancode.co/blog/building-a-design-system-in-flutter-app)
- [How to Implement Your Design System in Flutter](https://medium.com/@mregnauld/how-to-implement-your-design-system-in-a-flutter-app-1-2-d2e21b5fcffd)

---

## 📝 Quick Command Reference

```bash
# Setup
flutter create widgetbook --empty
cd widgetbook
flutter pub add widgetbook widgetbook_annotation dev:widgetbook_generator dev:build_runner

# Build
dart run build_runner build -d                    # One-time build
dart run build_runner watch -d                    # Watch mode
dart run build_runner build --delete-conflicting-outputs  # Force rebuild
dart run build_runner clean                       # Clean generated files

# Run
flutter run                                       # Run widgetbook app
flutter run -d chrome                             # Run on web
flutter run -d macos                              # Run on desktop
```

---

**💡 Pro Tip**: Keep this cheat sheet open in a separate tab while developing. Bookmark frequently used sections!

---

*Last updated: October 2024 | Widgetbook v3.19+*

