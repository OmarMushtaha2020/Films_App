import 'package:films_app/app/components/theme/theme.dart';
import 'package:films_app/app/data/web_services/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/characters_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  GetStorage storage = GetStorage();

  CharacterModel? characterModel;
  Future<void> getAllCharacters() async {
    Dio_Helpers.getData(method: "character").then((value){
      characterModel=   CharacterModel?.fromJson(value?.data);
      print(characterModel?.results?.length);
      update();

    });
  }
  bool isDark=false;
  Future<void> changeMode() async {
    isDark=!isDark;
    if(isDark==true){

      Get.changeTheme(ThemeModes.lightTheme);
    }else{
      Get.changeTheme(ThemeModes.darkTheme);

    }
    storage.write('isDark', isDark);
    print(isDark);
    update();
  }
}
