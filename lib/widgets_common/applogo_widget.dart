import 'package:ItenMart/consts/consts.dart';

Widget appLogoWidget() {
  //using velocity X
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
