import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import '/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '../../../../services/service_data.dart';
import '/widgets/header.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '/widgets/list_function.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/navigation_drawer_widget.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
// Example images
  String imagesFav = "assets/images/drugs_pill/300.jpg";

// Loading Shimmer Popular
  Widget __loadingPoShimmer() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: Dimensions.pageView,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer(
            child: Container(
              margin: EdgeInsets.only(right: 20, top: 10),
              width: 250,
              decoration: BoxDecoration(
                color: Palette.grey300,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(LoadingEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<HomeScreenBloc>(context);
          var dataPo = bloc.drugPoTop10;
          return Scaffold(
            drawer: const NavigationDrawerWidget(),
            appBar: appBarMain(titleText: "Trang chủ"),
            body: SingleChildScrollView(
              child: Column(children: [
                // Search bar
                Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    right: Dimensions.height30,
                    left: Dimensions.height30,
                    bottom: Dimensions.height20,
                  ),
                  child: Form(
                    key: this._formKey,
                    child: Column(
                      children: [
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autocorrect: true,
                            controller: this._typeAheadController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    print(_typeAheadController.text);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.search,
                                    color: Palette.mainBlueTheme,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius20),
                                  ),
                                  borderSide:
                                      BorderSide(color: Palette.mainBlueTheme),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius20),
                                  ),
                                  borderSide: BorderSide(
                                      width: 3, color: Palette.mainBlueTheme),
                                ),
                                labelText: 'Hôm nay bạn muốn tìm thuốc gì?'),
                          ),
                          suggestionsCallback: (String pattern) {
                            return TypeHead.getTypeAhead(pattern);
                          },
                          itemBuilder: (context, ProductModel suggestion) {
                            return ListTile(
                              title: AppTextTitle(
                                  text: suggestion.productName,
                                  color: Colors.black54,
                                  size: Dimensions.font18,
                                  fontWeight: FontWeight.normal),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          onSuggestionSelected: (ProductModel suggestion) {
                            BlocProvider.of<HomeScreenBloc>(context)
                              ..add(
                                OnTapEvent(
                                  context: context,
                                  product: suggestion,
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // List function
                ListIconFunction(),

                // List popular product
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: AppText(
                        text: "Xu hướng tìm kiếm",
                        size: Dimensions.font20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    state is LoadingSucessState
                        ? Container(
                            padding: EdgeInsets.only(left: 20),
                            height: Dimensions.pageView,
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: dataPo.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    bloc.add(
                                      OnTapEvent(
                                        context: context,
                                        product: dataPo[index],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20, top: 10),
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(imagesFav),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : __loadingPoShimmer()
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
