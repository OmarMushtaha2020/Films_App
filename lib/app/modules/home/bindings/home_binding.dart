import 'package:get/get.dart';

import 'package:films_app/app/modules/home/controllers/actor_data_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActorDataController>(
      () => ActorDataController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController()..getAllCharacters(),
    );

  }
}
