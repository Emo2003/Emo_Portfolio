
import 'constant_manager.dart';

class AppUrls {
  AppUrls._();

  static const String github =
      'https://github.com/Emo2003';

  static const String linkedIn =
      'https://www.linkedin.com/in/eman-medhat-704008401';

  static String email() {
    return 'mailto:${AppStrings.email}';
  }

  static String phone() {
    return 'tel:${AppStrings.phone.replaceAll(' ', '')}';
  }
}