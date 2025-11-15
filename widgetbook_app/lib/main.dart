import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart' show DeviceFrameAddon, Devices;
import 'package:widgetbook/src/addons/viewport_addon/viewport_data.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;


// This file will be generated automatically
import 'main.directories.g.dart';

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
      addons: [
        // Device frames - shows actual phone bezels/frames
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
            Devices.android.pixel4,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        // Viewport sizes - preview widgets at different screen sizes
        // You can select different viewports from the Addons panel
        ViewportAddon([
          ViewportData(
            name: 'iPhone 13',
            width: 390,
            height: 844,
            pixelRatio: 3.0,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'iPhone 13 Pro Max',
            width: 428,
            height: 926,
            pixelRatio: 3.0,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'Samsung Galaxy S20',
            width: 360,
            height: 800,
            pixelRatio: 3.0,
            platform: TargetPlatform.android,
          ),
          ViewportData(
            name: 'Pixel 4',
            width: 412,
            height: 915,
            pixelRatio: 2.63,
            platform: TargetPlatform.android,
          ),
        ]),
        // Theme switcher
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        // Text scaling
        TextScaleAddon(scales: [1.0, 1.5, 2.0], initialScale: 1.0),
        // Alignment - centers widgets (must be last/innermost)
        AlignmentAddon(),
      ],
    );
  }
}
