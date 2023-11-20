import 'package:faker_person_api/src/pages/person_details/controller.dart';
import 'package:get/get.dart';

import '../pages/home/controller.dart';
import '../pages/home/page.dart';
import '../pages/person_details/page.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.home,
      transition: Transition.fadeIn,
      page: () => const HomePage(),
      bindings: <BindingsBuilder>[
        BindingsBuilder(
          () => Get.put<HomeController>(HomeController(Get.find())),
        ),
      ],
    ),
    GetPage<dynamic>(
      name: Routes.personDetails,
      transition: Transition.fadeIn,
      page: () => const PersonDetailsPage(),
      bindings: <BindingsBuilder>[
        BindingsBuilder(
          () => Get.put<PersonDetailsController>(PersonDetailsController()),
        ),
      ],
    ),
  ];
}
