import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/android_app_controller.dart';

class AndroidAppView extends GetView<AndroidAppController> {
  const AndroidAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AndroidAppView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AndroidAppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
