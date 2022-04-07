import '/models/test/saved_drug_list_model.dart';
import '/pages/detail_screen/drug_details_saved.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteDrugsListScreenNav extends StatefulWidget {
  const FavoriteDrugsListScreenNav({Key key}) : super(key: key);

  @override
  _FavoriteDrugsListScreenNavState createState() =>
      _FavoriteDrugsListScreenNavState();
}

class _FavoriteDrugsListScreenNavState
    extends State<FavoriteDrugsListScreenNav> {
  String imagesFav = "16571-0402-50_NLMIMAGE10_903AC856.jpg";
  var _box = Hive.box<SavedDrugListModel>("savedList");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Danh sách yêu thích',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: _box.isEmpty
          ? Center(
              child: AppTextTitle(
              text: "Bạn chưa thêm thuốc mới",
              size: 20,
              fontWeight: FontWeight.w500,
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  // list of favorite games
                  ValueListenableBuilder(
                      valueListenable: _box.listenable(),
                      builder: (context, Box<SavedDrugListModel> item, _) {
                        List<int> keys = item.keys.cast<int>().toList();
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: keys.length,
                            itemBuilder: (context, index) {
                              final key = keys[index];
                              final SavedDrugListModel _item = item.get(key);
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
                                                DrugDetailSaved(
                                                    drugData: _item)),
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
                                              image: AssetImage(
                                                  "assets/images/drugs_pill/" +
                                                      imagesFav),
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
                                                    text: _item.tenThuoc,
                                                    color: Palette.textNo,
                                                    size: Dimensions.font20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  SizedBox(
                                                    height: Dimensions.height10,
                                                  ),
                                                  AppText(
                                                    text: _item.id,
                                                    color: Palette.textNo,
                                                    size: Dimensions.font16,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                            });
                      })
                ],
              ),
            ),
    );
  }
}
