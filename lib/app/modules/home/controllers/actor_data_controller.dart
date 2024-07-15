import 'package:films_app/app/data/model/characters_data_model.dart';
import 'package:films_app/app/data/web_services/dio.dart';
import 'package:get/get.dart';

class ActorDataController extends GetxController {
  //TODO: Implement ActorDataController

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
  CharactersData? charactersData;
  Future<void> getCharactersData(String id) async {
    Dio_Helpers.getData(method: "character/$id").then((value){
      charactersData=   CharactersData?.fromJson(value?.data);
      print(charactersData?.name);
      update();

    });
  }

}
