
import 'package:films_app/app/components/common_widget/icon_button_widget.dart';
import 'package:films_app/app/components/common_widget/search_delegate.dart';
import 'package:films_app/app/components/common_widget/text_widget.dart';
import 'package:films_app/app/modules/home/controllers/actor_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Row(
            children: [
              TextWidget(
                title: 'Characters',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme?.titleTextStyle?.color ?? Colors.black,
              ),
            ],
          ),
          actions: [
            IconButtonWidget(
              iconData: Icons.search,
              size: 25.h,
              color: Theme.of(context).iconTheme.color,

              onPressed: () {

                showSearch(context: context, delegate: MySearchDelegate(),);
              },
            ),
            IconButtonWidget(
              iconData: Icons.light_mode_outlined,
              size: 25.h,
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                controller.changeMode();
              },
            ),
          ],
        ),
        body:controller.characterModel?.results?.length!=0?

             GetBuilder<HomeController>(
               init: HomeController(),

               builder: (controller) {
                 return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  child: Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0.w, // Add spacing between each item
                          mainAxisSpacing: 10.0.h,
                          childAspectRatio: 3/4, // Adjust the aspect ratio as needed
                        ),
                        itemCount: controller.characterModel?.results?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              final ActorDataController actorController = Get.find<ActorDataController>();
                              actorController.getCharactersData("${controller.characterModel?.results?[index].id}").then((value) {
                               Future.delayed(Duration(microseconds: 60)).then((value) {
                                 Get.toNamed("/actor_data_screen");

                               });

                              });

                            },
                            child: Container(
                              width: 200.h,
                              height: 250.h,
                              decoration: BoxDecoration(
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                          "${controller.characterModel?.results?[index].image}"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.cyanAccent),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Opacity(
                                    opacity: 0.6,
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5.r),
                                            bottomRight: Radius.circular(5.r)),
                                      ),
                                      child: Center(
                                          child: TextWidget(
                                            title: '${controller.characterModel?.results?[index].name}',
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }


                    ),
                  ),
                             );
               }
             ): Center(child: CircularProgressIndicator())
    );



  }
}
