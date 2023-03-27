import 'package:get/get.dart';

import '../../../app/modules/android_app/bindings/android_app_binding.dart';
import '../../../app/modules/android_app/views/android_app_view.dart';
import '../../../app/modules/ios_app/bindings/ios_app_binding.dart';
import '../../../app/modules/ios_app/views/ios_app_view.dart';
import '../../../app/modules/home/home.screen.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.IOS_APP;

  static final routes = [
    GetPage(
      name: _Paths.IOS_APP,
      page: () =>  IosAppView(),
      binding: IosAppBinding(),
    ),
    GetPage(
      name: _Paths.ANDROID_APP,
      page: () => const AndroidAppView(),
      binding: AndroidAppBinding(),
    ),
     GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: AndroidAppBinding(),
    ),
  ];
}
