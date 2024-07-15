import 'package:films_app/app/components/theme/theme.dart';
import 'package:films_app/app/modules/home/controllers/home_controller.dart';
import 'package:films_app/app/routes/app_pages.dart';
import 'package:films_app/app/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home/bindings/home_binding.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => MyService().init());
  HomeBinding().dependencies();
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690), // Set your design size here
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (context, child) {

            HomeController homeController = Get.find<HomeController>();
print( homeController.storage.read("isDark"));

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
theme:  homeController.storage.read("isDark")==true?ThemeModes.lightTheme:ThemeModes.darkTheme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
