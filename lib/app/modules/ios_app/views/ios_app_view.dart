import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ios_app_controller.dart';

class IosAppView extends GetView<IosAppController> {
  const IosAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IosAppView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IosAppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
