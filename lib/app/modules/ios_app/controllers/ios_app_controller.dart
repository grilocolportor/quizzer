import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class IosAppController extends GetxController {
  late ARKitController arkitController;

  Timer? timer;
  var anchorWasFound = false.obs;

  var anchorId = ''.obs;
  var x = 0.0.obs, y = 0.0.obs;
  var width = 1.0.obs;
  var height = 1.0.obs;
  var transform = Matrix4.identity().obs;

  var anchorList = <ARKitReferenceImage>[].obs;

  @override
  void onInit() async {
    await getNetWorkImageTarget();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    arkitController.onAddNodeForAnchor = null;
    arkitController.onUpdateNodeForAnchor = null;
    arkitController.dispose();
    super.onClose();
  }

  Future<List<ARKitReferenceImage>> getNetWorkImageTarget() async {
    anchorList.value.addAll([
      const ARKitReferenceImage(
        name: 'https://m.media-amazon.com/images/I/61URccGBqfL._AC_SL1500_.jpg',
        physicalWidth: 0.2,
      ),
      const ARKitReferenceImage(
        name:
            'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61Kffx+uuqL._AC_SL1500_.jpg',
        physicalWidth: 0.2,
      )
    ]);

    return anchorList.value;
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = handleUpdateAnchor;
  }

  void handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      updatePosition(anchor);
      updateRotation(anchor);
    }
  }

  void handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      anchorId.value = anchor.identifier;
      updatePosition(anchor);
      updateRotation(anchor);
    }
  }

  void updateRotation(ARKitAnchor anchor) {
    final t = anchor.transform.clone();
    t.invertRotation();
    t.rotateZ(math.pi / 2);
    t.rotateX(math.pi / 2);

    transform.value = t;
  }

  Future<void> updatePosition(ARKitImageAnchor anchor) async {
    final transform = anchor.transform;
    final w = anchor.referenceImagePhysicalSize.x / 2;
    final h = anchor.referenceImagePhysicalSize.y / 2;

    final vector.Vector4 topRight = vector.Vector4(w, 0, -h, 1)
      ..applyMatrix4(transform);
    final vector.Vector4 bottonRight = vector.Vector4(w, 0, h, 1)
      ..applyMatrix4(transform);
    final vector.Vector4 topLeft = vector.Vector4(-w, 0, h, 1)
      ..applyMatrix4(transform);
    final vector.Vector4 bottonLeft = vector.Vector4(-w, 0, -h, 1)
      ..applyMatrix4(transform);

    final pointWorldSpace = [topRight, bottonRight, bottonLeft, topLeft];

    final pointViewprtSpace = pointWorldSpace.map(
      (p) => arkitController.projectPoint(vector.Vector3(p.x, p.y, p.z)),
    );
    final pointViewprtSpaceResults = await Future.wait(pointViewprtSpace);

    x.value = pointViewprtSpaceResults[2]!.x;
    y.value = pointViewprtSpaceResults[2]!.y;
    width.value =
        pointViewprtSpaceResults[0]!.distanceTo(pointViewprtSpaceResults[3]!);
    height.value =
        pointViewprtSpaceResults[1]!.distanceTo(pointViewprtSpaceResults[2]!);
  }
}
