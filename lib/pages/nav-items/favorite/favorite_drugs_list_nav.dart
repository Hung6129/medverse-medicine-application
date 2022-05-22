import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/models/drug_bank_db/fav_drug_model.dart';
import '/pages/nav-items/favorite/fav_drug_details.dart';
import '/widgets/navigation_drawer_widget.dart';

class FavoriteDrugsListScreenNav extends StatefulWidget {
  const FavoriteDrugsListScreenNav({Key key}) : super(key: key);

  @override
  _FavoriteDrugsListScreenNavState createState() =>
      _FavoriteDrugsListScreenNavState();
}

class _FavoriteDrugsListScreenNavState
    extends State<FavoriteDrugsListScreenNav> {
  String imagesFav =
      "assets/images/drugs_pill/16571-0402-50_NLMIMAGE10_903AC856.jpg";
  var _box = Hive.box<FavDrugModel>("fav-list");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Danh sách yêu thích',
            style: MobileTextTheme().appBarStyle,
          ),
          centerTitle: true,
        ),
        body: _box.isEmpty
            ? Center(
                child: AppText(
                text: "Bạn chưa thêm thuốc mới",
                size: Dimensions.font16,
                color: Palette.textNo,
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _box.listenable(),
                      builder: (context, Box<FavDrugModel> item, _) {
                        List<String> keys = item.keys.cast<String>().toList();
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: keys.length,
                          itemBuilder: (context, index) {
                            final key = keys[index];
                            final FavDrugModel _item = item.get(key);
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
                                      onPressed: (context) {
                                        setState(() {
                                          _box.deleteAt(index);
                                        });
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Xoá',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      icon: Icons.notification_add,
                                      label: 'Thông báo',
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FavDrugDetail(drugData: _item),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      //images section
                                      Container(
                                        width: Dimensions.itemsSizeImgHeight,
                                        height: Dimensions.itemsSizeImgHeight,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.radius20,
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(imagesFav),
                                          ),
                                        ),
                                      ),
                                      //text container
                                      Expanded(
                                        child: Container(
                                          height: Dimensions
                                              .itemsSizeTextIconHeight,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Dimensions.radius20),
                                              bottomRight: Radius.circular(
                                                  Dimensions.radius20),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppTextTitle(
                                                  text: _item.productName,
                                                  color: Palette.textNo,
                                                  size: Dimensions.font20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                                AppText(
                                                  text: _item.drugClearance,
                                                  color: Palette.textNo,
                                                  size: Dimensions.font16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
      ),
      onWillPop: () {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Exit"),
              content: Text("Are you sure you want to exit?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("YES"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                FlatButton(
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
