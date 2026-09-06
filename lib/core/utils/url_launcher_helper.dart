import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();

  static Future<void> open(String value) async {
    final Uri uri = Uri.parse(value);

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
    } catch (_) {
      // Ignore URL launch errors.
    }
  }
}