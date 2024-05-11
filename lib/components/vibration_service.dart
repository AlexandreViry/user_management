import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

/// Class for vibrating the phone
class VibrationService {
  /// Function to trigger vibration
  static Future<void> vibrate(dynamic context) async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate();
    } else {
      await _showNoVibrationDialog(context);
    }
  }

  /// Pattern and intensity of vibration
  static Future<void> vibrateWithPattern(dynamic context) async {
    if (await Vibration.hasCustomVibrationsSupport() ?? false) {
      await Vibration.vibrate(
        pattern: <int>[500, 1000, 500, 2000],
        intensities: <int>[128, 255, 128, 255],
      );
    } else {
      await _showNoVibrationDialog(context);
    }
  }

  /// Show dialog if the device does not support vibration
  static Future<void> _showNoVibrationDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Vibration Not Supported'),
          content: const Text('This device does not support vibration.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
