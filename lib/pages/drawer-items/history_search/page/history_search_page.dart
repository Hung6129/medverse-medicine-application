import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../theme/palette.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/dimension.dart';

class HistorySearchPage extends StatelessWidget {
  const HistorySearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget __getHistoryData() {
      return Container(
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10,
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  // await DeleteItemInFavList.deleteItems(
                  //     snapshot.data[index].productID);
                  // setState(
                  //   () {},
                  // );
                },
                backgroundColor: Palette.warningColor,
                foregroundColor: Colors.white,
                icon: CupertinoIcons.delete_solid,
                label: 'Xoá',
              ),
              // SlidableAction(
              //   onPressed: (context) {},
              //   backgroundColor: Palette.mainBlueTheme,
              //   foregroundColor: Colors.white,
              //   icon: Icons.notification_add,
              //   label: 'Thông báo',
              // ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              // print(snapshot.data[index].productID);
              // BlocProvider.of<HomeScreenBloc>(context)
              //   ..add(
              //     OnTapEvent(
              //       context: context,
              //       navigateData: snapshot.data[index].productID,
              //     ),
              //   );
            },
            child: Expanded(
              child: Container(
                height: Dimensions.itemsSizeImgHeight,
                decoration: BoxDecoration(color: Palette.mainBlueTheme),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Tylenol",
                        color: Palette.whiteText,
                        size: Dimensions.font16,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm nâng cao',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppText(text: "Lịch sử tìm kiếm của bạn"),  
          __getHistoryData()
        ],
      ),
    );
  }
}
