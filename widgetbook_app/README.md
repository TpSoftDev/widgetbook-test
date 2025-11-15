# Widgetbook App

This is the Widgetbook storybook application that showcases widgets from the main app.

## What This Is

This folder contains a **separate Flutter project** that:
- Imports widgets from the main app (`widgetbook_test`)
- Creates stories (variations/examples) of those widgets
- Builds a web app for viewing the widget catalog

## Quick Start

```bash
# Install dependencies
flutter pub get

# Generate story directories
dart run build_runner build -d

# Run locally
flutter run -d chrome
```

## Deployment

This app is automatically deployed to GitHub Pages when you push to the `main` branch via GitHub Actions.

See `.github/workflows/deploy.yml` for deployment configuration.
