import 'package:ItenMart/consts/consts.dart';
import 'package:ItenMart/consts/lists.dart';
import 'package:ItenMart/controllers/auth_controller.dart';
// import 'package:ItenMart/controllers/profile_controller.dart';
import 'package:ItenMart/services/firestore_services.dart';
import 'package:ItenMart/views/auth_screen/login_screen.dart';
import 'package:ItenMart/views/profile_screen/components/details_card.dart';
import 'package:ItenMart/views/profile_screen/edit_profile_screen.dart';
import 'package:ItenMart/widgets_common/bg_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(profileController());

    return bgWidget(
        child: Scaffold(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            // var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Column(
                children: [
                  // edit profile button
                  const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: whiteColor))
                      .onTap(() {
                    Get.to(() => const editProfileScreen());
                  }),

                  // users detail section

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image.asset(imgFotoFahmi, width: 100, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                        10.widthBox,
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // "${data['name']}"
                                //     .text
                                //     .fontFamily(semibold)
                                //     .white
                                //     .make(),
                                // "${data['email']}".text.white.make(),
                                "Fahmi Triseptiyadi".text.fontFamily(semibold).white.make(),
                                "fahmii.triseptiyadii@gmail.com".text.white.make(),
                              ]),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                              color: whiteColor,
                            )),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => loginScreen());
                            },
                            child: "Log Out"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make())
                      ],
                    ),
                  ),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // detailsCard(
                      //     count: data['cart_count'],
                      //     title: "in your cart",
                      //     width: context.screenWidth / 3.4),
                      // detailsCard(
                      //     count: data['wishlist_count'],
                      //     title: "in your wishlist",
                      //     width: context.screenWidth / 3.4),
                      // detailsCard(
                      //     count: data['order_count'],
                      //     title: "your orders",
                      //     width: context.screenWidth / 3.4),
                      detailsCard(
                          count: "00",
                          title: "in your cart",
                          width: context.screenWidth / 3.4),
                      detailsCard(
                          count: "00",
                          title: "in your wishlist",
                          width: context.screenWidth / 3.4),
                      detailsCard(
                          count: "00",
                          title: "your orders",
                          width: context.screenWidth / 3.4),
                    ],
                  ),

                  // 40.heightBox,

                  // buttons section
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 22,
                        ),
                        title: profileButtonsList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                  )
                      .box
                      .white
                      .rounded
                      .margin(const EdgeInsets.all(12))
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make(),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
