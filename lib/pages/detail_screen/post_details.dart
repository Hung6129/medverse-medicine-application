// import 'package:druginfomobileapp/theme/palette.dart';
// import '/widgets/app_btn.dart';
// import '/widgets/app_text.dart';
// import '/widgets/responsive_btn.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class PostDetails extends StatefulWidget {
//   const PostDetails({Key? key}) : super(key: key);

//   @override
//   _PostDetailsState createState() => _PostDetailsState();
// }

// class _PostDetailsState extends State<PostDetails> {
//   int selectedIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Palette.p1,
//         width: double.maxFinite,
//         height: double.maxFinite,
//         child: Stack(
//           children: [
//             Positioned(
//               left: 0,
//               right: 0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Palette.p5,
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/drugs_pill/Calcet.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 width: double.maxFinite,
//                 height: 350,
//               ),
//             ),
//             Positioned(
//               left: 20,
//               top: 40,
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.arrow_back,
//                       size: 30,
//                       color: Palette.p1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 300,
//               child: Container(
//                 padding: EdgeInsets.only(left: 20, right: 20, top: 30),
//                 width: MediaQuery.of(context).size.width,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   color: Palette.p1,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         AppText(
//                           text: "Entyvio",
//                           color: Palette.textNo,
//                           size: 30,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         // AppText(
//                         //   text: "250",
//                         //   color: Palette.textNo,
//                         //   size: 20,
//                         //   fontWeight: FontWeight.w400,
//                         // ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.rate_review_rounded,
//                           size: 30,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         AppText(
//                           text: 'Hung Nguyen',
//                           color: Palette.textNo.withOpacity(0.5),
//                           size: 20,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         RatingBar.builder(
//                           initialRating: 3,
//                           itemSize: 25,
//                           minRating: 0.5,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           onRatingUpdate: (value) {},
//                           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                           itemBuilder: (context, _) {
//                             return Icon(
//                               Icons.star,
//                               color: Palette.starRating,
//                             );
//                           },
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         AppText(
//                             text: '(4,5)',
//                             color: Palette.textNo,
//                             size: 15,
//                             fontWeight: FontWeight.normal)
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     AppText(
//                       text: "Mọi người",
//                       color: Palette.textNo,
//                       size: 25,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     AppText(
//                       text: "Số người đã đánh giá",
//                       color: Palette.textNo,
//                       size: 20,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(
//                       children: List.generate(5, (index) {
//                         return InkWell(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = index;
//                             });
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             child: AppButton(
//                               bgColor: selectedIndex == index
//                                   ? Palette.p5
//                                   : Palette.p5.withOpacity(0.5),
//                               borderColor: Palette.p1,
//                               color: selectedIndex == index
//                                   ? Palette.p1
//                                   : Palette.p1.withOpacity(0.5),
//                               size: 50,
//                               text: (index + 1).toString(),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     AppText(
//                       text: "Mô tả",
//                       color: Palette.textNo,
//                       size: 25,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     AppText(
//                       text:
//                           "Entyvio (vedolizumab) làm giảm tác động của một chất có thể gây viêm trong cơ thể.",
//                       color: Palette.textNo,
//                       size: 20,
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Row(
//                   children: [
//                     AppButton(
//                       bgColor: Palette.p1.withOpacity(0.9),
//                       borderColor: Palette.p5,
//                       color: Palette.p5,
//                       size: 60,
//                       isIcon: true,
//                       icon: Icons.favorite_border_outlined,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     ResponsiveButton(
//                       color: Palette.p5,
//                       isResponsive: true,
//                     ),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
