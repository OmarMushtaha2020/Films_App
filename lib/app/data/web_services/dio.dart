import 'package:dio/dio.dart';

class Dio_Helpers {
  static Dio? dio;

  static void inti() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://rickandmortyapi.com/api/", receiveDataWhenStatusError: true),
    );
  }

  static Future<Response?> getData(
      {required String method, Map<String, dynamic>? query}) async {
    try {
      return await dio?.get(method, queryParameters: query);
    } catch (e) {
      // Handle errors here (e.g., network errors)
      print("Error: $e");
      return null;
    }
  }
}
