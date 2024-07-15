import 'package:films_app/app/data/web_services/dio.dart';
import 'package:films_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MyService extends GetxService {


  Future<MyService> init() async {
    Dio_Helpers.inti();
    // Initialize your service here
    await GetStorage.init();
    return this;
  }


  void someMethod() {
    print("Service method called");
  }
}
