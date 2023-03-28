import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../infrastructure/presentations/components/quizzer_Identifies.dart';
import '../controllers/ios_app_controller.dart';

class IosAppView extends GetView<IosAppController> {
  const IosAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Image Detection Sample')),
        body: Stack(
          fit: StackFit.expand,
          children: [sceneView(context), positionWidget(context)],
        ),
      );

  Widget sceneView(BuildContext context) {
    var sceneController = Get.put(IosAppController());
    return Obx(
      () => ARKitSceneView(
        trackingImages: sceneController.anchorList.value,
        onARKitViewCreated: sceneController.onARKitViewCreated,
        worldAlignment: ARWorldAlignment.camera,
        configuration: ARKitConfiguration.imageTracking,
      ),
    );
  }

  Widget positionWidget(BuildContext context) {
    var sceneController = Get.put(IosAppController());
    return Obx(
      () => Positioned(
        left: sceneController.x.value,
        top: sceneController.y.value,
        child: Container(
          color: Colors.transparent,
           // transform: sceneController.transform.value,
           width:  sceneController.width.value,
            height: sceneController.height.value, 
            child:  QuizzerIdentifier(
              backgroundColor: sceneController.setAnswerBoxColor.value ? Colors.green : Colors.red,
              text: sceneController.answer.value,
            )),
      ),
    );
  }
}
