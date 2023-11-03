import 'package:app_settings/app_settings.dart';

final class AppSettinsUtils {
  AppSettinsUtils._();

  static void openAppSettings() async {
    await AppSettings.openAppSettings(type: AppSettingsType.settings);
  }

  static void openLocationSettings() async {
    await AppSettings.openAppSettings(type: AppSettingsType.location);
  }
}
