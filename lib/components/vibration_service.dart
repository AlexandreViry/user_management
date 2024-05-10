// ignore_for_file: public_member_api_docs

import 'package:vibration/vibration.dart';

//class pour la vibration du téléphone
class VibrationService {
  static Future<void> vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate();
    } else {
      // Si le téléhpone n'a pas de vibration
    }
  }

  static Future<void> vibrateWithPattern() async {
    if (await Vibration.hasCustomVibrationsSupport() ?? false) {
      await Vibration.vibrate(
        pattern: <int>[
          500,
          1000,
          500,
          2000,
        ], // paterne de vibration
        intensities: [128, 255, 128, 255], // intensité de la vibration
      );
    }
  }
}
