import 'package:films_app/app/components/common_widget/icon_button_widget.dart';
import 'package:films_app/app/components/common_widget/text_widget.dart';
import 'package:films_app/app/data/model/characters_model.dart';
import 'package:films_app/app/modules/home/controllers/actor_data_controller.dart';
import 'package:films_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MySearchDelegate extends SearchDelegate {

  final ActorDataController actorController = Get.find<ActorDataController>();

  final HomeController controller = Get.find<HomeController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButtonWidget(
        iconData: Icons.clear,
        size: 25.h,
        onPressed: () {
          query = '';
        },
        color: Theme.of(context).iconTheme.color,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButtonWidget(

      iconData:     Icons.arrow_back,
      size: 25.h,
      onPressed: () {
        close(context, null);
      },
      color: Theme.of(context).iconTheme.color,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Results>? results = controller.characterModel?.results?.where((element) => element.name==query).toList();


        return
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height:Get.height,
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
                      itemCount: results?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            actorController.getCharactersData("${results?[index].id}").then((value) {
                              Future.delayed(Duration(microseconds: 200)).then((value) {
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
                                        "${results?[index].image}"),
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
                                          title: '${results?[index].name}',
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
                );



  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Results>?  suggestions = query.isEmpty ? controller.characterModel?.results: controller.characterModel?.results?.where((element) => element.name!.contains(query)).toList();


        return    Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
height: Get.height,
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
                itemCount: suggestions?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      actorController.getCharactersData("${suggestions?[index].id}").then((value) {
                        Future.delayed(Duration(microseconds: 200)).then((value) {
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
                                  "${suggestions?[index].image}"),
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
                                    title: '${suggestions?[index].name}',
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
}
