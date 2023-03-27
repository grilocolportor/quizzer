import 'package:get/get.dart';

import '../modules/android_app/bindings/android_app_binding.dart';
import '../modules/android_app/views/android_app_view.dart';
import '../modules/ios_app/bindings/ios_app_binding.dart';
import '../modules/ios_app/views/ios_app_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.IOS_APP,
      page: () => const IosAppView(),
      binding: IosAppBinding(),
    ),
    GetPage(
      name: _Paths.ANDROID_APP,
      page: () => const AndroidAppView(),
      binding: AndroidAppBinding(),
    ),
  ];
}
