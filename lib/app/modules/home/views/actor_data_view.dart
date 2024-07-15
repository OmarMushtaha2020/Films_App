import 'package:films_app/app/components/common_widget/text_widget.dart';
import 'package:films_app/app/modules/home/controllers/actor_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ActorDataView extends GetView<ActorDataController> {
  const ActorDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActorDataController>(
      init: ActorDataController(),
    builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height/2), // Adjust the height as needed

            child: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, // Set the color you want for the back arrow
              ),
              flexibleSpace: Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(image: NetworkImage("${controller.charactersData?.image}",),fit: BoxFit.cover),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(title: "${controller.charactersData?.name}", color: Colors.white,fontSize: 25.h,fontWeight: FontWeight.w500,),
                    ],
                  ),
                ),
              ),

            ),
          ),
          body: Container(
            color: Colors.blueGrey.withOpacity(0.7),
height: Get.height,
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(title: "status : ${controller.charactersData?.status}", fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500),
                          Container(width: 50.w,child: const Divider(color: Colors.orange,thickness: 3,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: TextWidget(title: "gender : ${controller.charactersData?.gender}", fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          Container(width: 70.w,child: const Divider(color: Colors.orange,thickness: 3,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: TextWidget(title: "created : ${controller.charactersData?.created?.substring(0,10)}", fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          Container(width: 90.w,child: const Divider(color: Colors.orange,thickness: 3,)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 5.w),
                          child: TextWidget(title: "species/Actress : ${controller.charactersData?.species}", fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Container(width: 150.w,child: const Divider(color: Colors.orange,thickness: 3,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }

    );
  }
}
