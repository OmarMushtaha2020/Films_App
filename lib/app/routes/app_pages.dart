import 'package:films_app/app/modules/home/views/actor_data_view.dart';
import 'package:films_app/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HomeScreen;

  static final routes = [
    GetPage(
      name: _Paths.HomeScreen,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ActorDataScreen,
      page: () => ActorDataView(),
      binding: HomeBinding(),
    ),

  ];
}
