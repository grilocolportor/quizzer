import 'package:get/get.dart';

import '../controllers/ios_app_controller.dart';

class IosAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IosAppController>(
      () => IosAppController(),
    );
  }
}
