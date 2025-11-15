# Widgetbook Test Project

A Flutter project showcasing widgets using Widgetbook.

## 📚 Quick Navigation

- **[PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md)** - Understand the folder structure
- **[DEPLOYMENT_STATUS.md](./DEPLOYMENT_STATUS.md)** - What's deployed and how it works
- **[WIDGETBOOK_CHEATSHEET.md](./WIDGETBOOK_CHEATSHEET.md)** - Widgetbook reference guide

## 🏗️ Project Structure

This project has two main parts:

1. **Main App** (`lib/`) - Your actual Flutter widgets
2. **Widgetbook App** (`widgetbook_app/`) - Storybook that showcases your widgets

## 🚀 Quick Start

### View Widgetbook Locally
```bash
cd widgetbook_app
flutter pub get
dart run build_runner build -d
flutter run -d chrome
```

### Add a New Widget
1. Create widget in `lib/widgets/my_widget.dart`
2. Create story in `widgetbook_app/lib/my_widget_stories.dart`
3. Run `dart run build_runner build -d` in `widgetbook_app/`
4. View in Widgetbook!

## 📦 Current Widgets

- **CustomButton** - Button widget with loading states
- **UserCard** - User card with avatar support

## 🔄 Deployment

This project automatically deploys to GitHub Pages when you push to `main` branch.

See `.github/workflows/deploy.yml` for configuration.

---

For detailed information, see [PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md)
