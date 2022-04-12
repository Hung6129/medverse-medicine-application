import 'package:get/get.dart';

class Dimensions {
// get screen device width and height
  static double screenHeight = Get.context.height;
  static double screenWidth = Get.context.width;

// height dimensions
  // height 250
  static double postContainerView = screenHeight / 2.732;
  // images height 300
  static double imagesViewHeight = screenHeight / 2.276;
  //

  // width dimensions
  // width 250
  static double imagesViewWidth = screenHeight / 2.732;
  static double boxViewWidth = screenHeight / (screenHeight / 350);

  // dynamic pill identifier
  static double pillIdentifierW = screenWidth / (screenWidth / 400);
  static double pillIdentifierH = screenHeight / (screenHeight / 300);
  static double boxSearchViewWidth = screenHeight / (screenHeight / 340);

//dynamic height padding and margin
  static double height5 = screenHeight / (screenHeight / 5);
  static double height10 = screenHeight / (screenHeight / 10);
  static double height15 = screenHeight / (screenHeight / 15);
  static double height20 = screenHeight / (screenHeight / 20);
  static double height25 = screenHeight / (screenHeight / 25);
  static double height30 = screenHeight / (screenHeight / 30);
  static double height35 = screenHeight / (screenHeight / 35);
  static double height45 = screenHeight / (screenHeight / 45);

//dynamic width padding and margin
  static double width10 = screenHeight / (screenHeight / 10);
  static double width15 = screenHeight / (screenHeight / 15);
  static double width20 = screenHeight / (screenHeight / 20);
  static double width25 = screenHeight / (screenHeight / 25);
  static double width30 = screenHeight / (screenHeight / 30);
  static double width35 = screenHeight / (screenHeight / 35);
  static double width45 = screenHeight / (screenHeight / 40);
  static double width50 = screenHeight / (screenHeight / 50);

//dynamic icons size
  static double icon16 = screenHeight / (screenHeight / 16);
  static double icon24 = screenHeight / (screenHeight / 24);
  static double icon28 = screenHeight / (screenHeight / 28);

// dynamic font size
  static double font14 = screenHeight / (screenHeight / 14);
  static double font16 = screenHeight / (screenHeight / 16);
  static double font18 = screenHeight / (screenHeight / 18);
  static double font20 = screenHeight / (screenHeight / 20);
  static double font24 = screenHeight / (screenHeight / 24);
  static double font26 = screenHeight / (screenHeight / 26);
  static double font32 = screenHeight / (screenHeight / 32);
  static double font34 = screenHeight / (screenHeight / 34);

//
  static double radius15 = screenHeight / (screenHeight / 15);
  static double radius20 = screenHeight / (screenHeight / 20);
  static double radius30 = screenHeight / (screenHeight / 30);

// popular image detail
  static double popularImageDetail = screenHeight / (screenHeight / 300);

// bottom height
  static double bottomHeight = screenHeight / (screenHeight / 100);

// favorite list items
  static double itemsSizeImgHeight = screenHeight / (screenHeight / 150);
  static double itemsSizeTextIconHeight = screenHeight / (screenHeight / 130);

// home screen
  static double pageView = screenHeight / (screenHeight / 240);
  static double pageViewContainer = screenHeight / (screenHeight / 180);
  static double pageViewTextContainer = screenHeight / (screenHeight / 120);
}
