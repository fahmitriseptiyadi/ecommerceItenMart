import 'dart:io';

import 'package:ItenMart/consts/consts.dart';
import 'package:ItenMart/consts/images.dart';
import 'package:ItenMart/controllers/profile_controller.dart';
import 'package:ItenMart/widgets_common/bg_widgets.dart';
import 'package:ItenMart/widgets_common/custom_TextField.dart';
import 'package:ItenMart/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editProfileScreen extends StatelessWidget {
  const editProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var controller = Get.find<profileController>();
    Get.put(profileController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(imgFotoFahmi, width: 100, fit: BoxFit.cover)
                  : Image.file(
                      File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              Divider(),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false),
              customTextField(hint: password, title: password, isPass: true),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child: ourButton(
                    color: redColor,
                    onPress: () {},
                    textColor: whiteColor,
                    title: "Save"),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
