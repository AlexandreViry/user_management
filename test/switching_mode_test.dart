import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:user_management/components/get_x_theme_controller.dart';
import 'package:user_management/components/theme_switching.dart';

void main() {
  setUpAll(() {
    Get.testMode = true; // Enable GetX test mode
    Get.put(
        ThemeController()); // Put an instance of ThemeController into the GetX dependency system
  });

  testWidgets('ThemeSwitchingWidget toggles theme correctly',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: ThemeSwitchingWidget(),
        ),
      ),
    );

    // Initial state should be light theme
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.byIcon(Icons.sunny), findsOneWidget);

    // Simulate tapping the switch
    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle(); // Pump to settle the animation

    // After tapping, the theme should toggle to dark theme
    final ThemeController themeController = Get.find<ThemeController>();
    expect(themeController.themeData.value.brightness, Brightness.dark);
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
  });
}
