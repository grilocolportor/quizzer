import 'package:get/get.dart';

import '../controllers/android_app_controller.dart';

class AndroidAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidAppController>(
      () => AndroidAppController(),
    );
  }
}
