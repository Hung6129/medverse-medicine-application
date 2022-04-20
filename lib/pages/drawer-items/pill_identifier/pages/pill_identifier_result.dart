import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PillIdentifierListDrug extends StatefulWidget {
  final String query1;
  final String query2;

  const PillIdentifierListDrug({
    Key key,
    this.query1 = "",
    this.query2 = "",
  }) : super(key: key);

  @override
  State<PillIdentifierListDrug> createState() => _PillIdentifierListDrugState();
}

class _PillIdentifierListDrugState extends State<PillIdentifierListDrug> {
  String img300 = "assets/images/drugs_pill/300.jpg";
  String img600 = "assets/images/drugs_pill/600.jpg";

  // Widget _sortedListData(DrugsDataCubit cubit) {
  //   return BlocBuilder<DrugsDataCubit, DrugsDataState>(
  //     builder: (context, state) {
  //       if (state is DrugsDataLoaded) {
  //         var data = cubit.drugs;
  //         return ListView.builder(
  //           physics: NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           itemCount: data.length,
  //           itemBuilder: (context, index) => Container(
  //             margin: EdgeInsets.only(
  //               left: Dimensions.width20,
  //               right: Dimensions.width20,
  //               bottom: Dimensions.height10,
  //             ),
  //             child: GestureDetector(
  //               onTap: () {},
  //               child: Column(
  //                 children: [
  //                   //images section
  //                   Container(
  //                     width: Dimensions.pillIdentifierW,
  //                     height: Dimensions.pillIdentifierH,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(
  //                         Dimensions.radius20,
  //                       ),
  //                       color: Palette.p1,
  //                       image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image: AssetImage(img300),
  //                       ),
  //                     ),
  //                   ),

  //                   //text container
  //                   Container(
  //                     width: 350,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(Dimensions.radius20),
  //                         bottomRight: Radius.circular(Dimensions.radius20),
  //                       ),
  //                       color: Colors.white,
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         AppTextTitle(
  //                           text: data[index].title,
  //                           color: Palette.textNo,
  //                           size: Dimensions.font20,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                         AppText(
  //                           text: data[index].price.toString(),
  //                           color: Palette.textNo,
  //                           size: Dimensions.font16,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                         AppText(
  //                           text: data[index].description,
  //                           color: Palette.textNo,
  //                           size: Dimensions.font16,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                         AppText(
  //                           text: data[index].category,
  //                           color: Palette.textNo,
  //                           size: Dimensions.font16,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: Dimensions.height15)
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       } else {
  //         return AppTextTitle(
  //             text: "Something went wrong",
  //             color: Colors.black45,
  //             size: Dimensions.font18,
  //             fontWeight: FontWeight.w500);
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm nâng cao',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height15),
              child: AppText(
                color: Palette.textNo,
                size: Dimensions.font20,
                fontWeight: FontWeight.normal,
                text: widget.query1.isEmpty || widget.query2.isEmpty
                    ? "Kết quả cho thuốc có  ${widget.query1} ${widget.query2}"
                    : "Kết quả cho thuốc có dạng " +
                        " ${widget.query1}" +
                        " và " +
                        "${widget.query2}",
              ),
            ),

            // list of query
            // _sortedListData(cubit),
          ],
        ),
      ),
    );
  }
}
