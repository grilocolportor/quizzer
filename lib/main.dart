import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'infrastructure/navigation/routes/app_pages.dart';

void main() async {
  var initialRoute =  AppPages.INITIAL;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    );
  }
}
