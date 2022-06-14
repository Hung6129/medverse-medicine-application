import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '/models/drug_bank_db/favorite_list_model_w_name.dart';
import '../../../services/service_data.dart';
import '../../../widgets/indicators.dart';
import '../home/bloc/home_screen_bloc.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';

import '/widgets/navigation_drawer_widget.dart';

class FavoriteDrugsListScreenNav extends StatefulWidget {
  const FavoriteDrugsListScreenNav({
    Key key,
  }) : super(key: key);

  @override
  _FavoriteDrugsListScreenNavState createState() =>
      _FavoriteDrugsListScreenNavState();
}

class _FavoriteDrugsListScreenNavState
    extends State<FavoriteDrugsListScreenNav> {
  String imagesFav =
      "assets/images/drugs_pill/16571-0402-50_NLMIMAGE10_903AC856.jpg";

  List<FavoriteListWName> dataList;
  Future<List<FavoriteListWName>> _getAll() async {
    dataList = await GetFavoriteList.getFavoriteList();
    if (dataList.isEmpty) {
      return null;
    } else
      print(dataList.length);
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    /// Return emty
    Widget __emtyList() {
      return Center(
        child: AppText(
            text: "Bạn chưa thêm thuốc mới",
            size: Dimensions.font16,
            color: Palette.mainBlueTheme),
      );
    }

    /// Return list favorite
    Widget __getFavList() {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            FutureBuilder<List<FavoriteListWName>>(
                future: _getAll(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return circularProgress(context);
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height20,
                          ),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    await DeleteItemInFavList.deleteItems(
                                        snapshot.data[index].productID);
                                    setState(
                                      () {},
                                    );
                                  },
                                  backgroundColor: Palette.warningColor,
                                  foregroundColor: Colors.white,
                                  icon: CupertinoIcons.delete_solid,
                                  label: 'Xoá',
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                print(snapshot.data[index].productID);
                                BlocProvider.of<HomeScreenBloc>(context)
                                  ..add(
                                    OnTapEvent(
                                      context: context,
                                      navigateData:
                                          snapshot.data[index].productID,
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
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Dimensions.radius20),
                                          bottomLeft: Radius.circular(
                                              Dimensions.radius20)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(imagesFav),
                                      ),
                                    ),
                                  ),
                                  //text container
                                  Expanded(
                                    child: Container(
                                      height: Dimensions.itemsSizeImgHeight,
                                      decoration:
                                          BoxDecoration(color: Palette.white60),
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
                                            AppText(
                                              text: snapshot
                                                  .data[index].product_name,
                                              color: Palette.textNo,
                                              size: Dimensions.font16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            SizedBox(
                                                height: Dimensions.height10),
                                            AppText(
                                              text: "Đã lưu vào " +
                                                  snapshot
                                                      .data[index].savedTime,
                                              color: Palette.textNo,
                                              size: Dimensions.font14,
                                              fontWeight: FontWeight.normal,
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
                  }
                  if (snapshot.data == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Empty-list.png"),
                        __emtyList()
                      ],
                    );
                  } else {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/error_image.png"),
                        AppText(
                          text: "Đã có lỗi gì đó xảy ra",
                          color: Palette.warningColor,
                        )
                      ],
                    ));
                  }
                })
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Danh sách yêu thích',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: _getAll == null ? __emtyList() : __getFavList(),
    );
  }
}
