# 📁 Project Structure Guide

This document explains the structure of this Widgetbook project to help you navigate and understand what's happening.

## 🎯 Overview

This project has **two main parts**:
1. **Your Flutter App** - Contains your actual widgets
2. **Widgetbook App** - A separate Flutter project that showcases your widgets in a storybook

---

## 📂 Folder Structure

```
widgetbook_test/                    # Root project
│
├── lib/                            # YOUR FLUTTER APP CODE
│   ├── main.dart                  # Main app entry point
│   └── widgets/                   # Your actual widget implementations
│       ├── custom_button.dart     # CustomButton widget
│       ├── user_card.dart         # UserCard widget
│       ├── custom_button.widgetbook.dart  # (Optional) Local stories
│       └── user_card.widgetbook.dart      # (Optional) Local stories
│
├── widgetbook_app/                 # WIDGETBOOK STORYBOOK APP
│   ├── lib/                       # Widgetbook-specific code
│   │   ├── main.dart             # Widgetbook app entry point
│   │   ├── custom_button_stories.dart  # Stories for CustomButton
│   │   ├── user_card_stories.dart      # Stories for UserCard
│   │   └── main.directories.g.dart     # Auto-generated (don't edit)
│   │
│   ├── build/                     # Build output (local)
│   │   └── web/                  # Web build (used for deployment)
│   │
│   ├── docs/                      # Old deployed files (can be ignored)
│   │
│   └── pubspec.yaml              # Widgetbook app dependencies
│
├── .github/
│   └── workflows/
│       └── deploy.yml            # GitHub Actions: Auto-deploys to GitHub Pages
│
└── pubspec.yaml                   # Main app dependencies
```

---

## 🔄 How It Works

### 1. **Your Widgets** (`lib/widgets/`)
- These are your **actual Flutter widgets** that you use in your app
- Examples: `CustomButton`, `UserCard`
- These are **reusable components** for your real app

### 2. **Widgetbook Stories** (`widgetbook_app/lib/`)
- These files **import your widgets** and create "stories" (variations/examples)
- Stories show different states: loading, disabled, different colors, etc.
- These are **only for documentation/showcasing**, not used in your real app

### 3. **Deployment** (GitHub Actions)
- When you push to `main` branch, GitHub Actions automatically:
  1. Builds the `widgetbook_app` project
  2. Generates the storybook web app
  3. Deploys it to GitHub Pages
- **What's deployed**: The web version of your widgetbook (accessible online)
- **What's NOT deployed**: Your main app code (stays private)

---

## 🚀 Common Tasks

### View Widgetbook Locally
```bash
cd widgetbook_app
flutter pub get
dart run build_runner build -d
flutter run -d chrome
```

### Add a New Widget
1. Create widget in `lib/widgets/my_widget.dart`
2. Create story file in `widgetbook_app/lib/my_widget_stories.dart`
3. Import your widget: `import 'package:widgetbook_test/widgets/my_widget.dart';`
4. Run `dart run build_runner build -d` in `widgetbook_app/`
5. View in Widgetbook!

### Deploy Updates
- Just push to `main` branch
- GitHub Actions handles the rest
- Check GitHub Pages for the deployed version

---

## 📝 Key Files Explained

| File | Purpose |
|------|---------|
| `lib/widgets/*.dart` | Your actual widget code |
| `widgetbook_app/lib/*_stories.dart` | Stories showcasing your widgets |
| `.github/workflows/deploy.yml` | Auto-deployment configuration |
| `widgetbook_app/build/web/` | Built web app (deployed to GitHub Pages) |

---

## 💡 Tips

- **Widgets** = Your real app code
- **Stories** = Documentation/showcase (Widgetbook only)
- **Deployment** = Automatic via GitHub Actions
- **Local development** = Run `flutter run` in `widgetbook_app/` folder

---

## 🎓 Learning Path

1. **Start here**: Look at `lib/widgets/custom_button.dart` - this is a real widget
2. **Then check**: `widgetbook_app/lib/custom_button_stories.dart` - see how it's showcased
3. **Run locally**: `cd widgetbook_app && flutter run -d chrome`
4. **Make changes**: Edit widgets or stories, see them update live!

---

*Last updated: After folder reorganization*

