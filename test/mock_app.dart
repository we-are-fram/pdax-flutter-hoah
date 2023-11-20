import 'package:faker_person_api/src/repositories/person.dart';
import 'package:faker_person_api/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mocks/person_mock.dart';

class MockAppUtil {
  MockAppUtil();

  static Future<MockApp> createMockApp({
    Key? key,
    VoidCallback? bindings,
    required Widget child,
  }) async {
    return MockApp(key: key, bindings: bindings, child: child);
  }
}

class MockApp extends StatelessWidget {
  MockApp({Key? key, required this.child, this.bindings}) : super(key: key) {
    Get.testMode = true;
  }

  final Widget child;
  final VoidCallback? bindings;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: Routes.home,
      initialBinding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<PersonRepository>(() => MockPersonRepository(),
            fenix: true);
        if (bindings != null) {
          bindings!();
        }
      }),
      home: child,
    );
  }
}
