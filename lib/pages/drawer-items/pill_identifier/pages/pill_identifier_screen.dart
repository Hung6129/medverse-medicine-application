import '/widgets/app_text_title.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';
import 'pill_identifier_list_drug.dart';

class Identifier extends StatefulWidget {
  const Identifier({Key key}) : super(key: key);

  @override
  _IdentifierState createState() => _IdentifierState();
}

class _IdentifierState extends State<Identifier> {
  TextEditingController txtCon = TextEditingController();
  List<String> colors = [
    "Màu sắc",
    "ORANGE,ORANGE",
    "PURPLE,GRAY",
    "YELLOW,PURPLE",
    "GREEN,BLACK",
    "BROWN,YELLOW",
    "PINK,BLACK",
    "WHITE,GREEN",
    "TURQUOISE",
    "RED,BLUE",
    "RED,WHITE",
    "BLUE,GREEN",
    "ORANGE,BROWN",
    "YELLOW,ORANGE",
    "GREEN,WHITE",
    "RED,YELLOW",
    "GREEN,PINK",
    "GREEN,PURPLE",
    "PINK,PINK",
    "GRAY,RED",
    "WHITE,BLACK",
    "WHITE,WHITE",
    "PURPLE,TURQUOISE",
    "YELLOW,WHITE",
    "GRAY,PURPLE",
    "BLACK,PINK",
    "PINK,YELLOW",
    "GREEN",
    "BLUE",
    "YELLOW,RED",
    "GRAY,WHITE",
    "BROWN,PINK",
    "GREEN,TURQUOISE",
    "TURQUOISE,GREEN",
    "BLUE,ORANGE",
    "YELLOW,YELLOW",
    "GREEN,GRAY",
    "YELLOW,PINK",
    "PURPLE,YELLOW",
    "PURPLE,ORANGE",
    "YELLOW,BLUE",
    "YELLOW",
    "BLACK,GREEN",
    'PINK',
  ];

  List<String> shapes = [
    'Hình dạng',
    "SEMI-CIRCLE",
    "FREEFORM",
    "DIAMOND",
    "HEXAGON(6sided)",
    "CAPSULE",
    "SQUARE",
    "TEAR",
    "OCTAGON (8sided)",
    "PENTAGON(5sided)",
    "BULLET",
    "TRIANGLE",
    "RECTANGLE",
    "TRAPEZOID",
    "OVAL",
    "DOUBLECIRCLE",
    "ROUND",
  ];

  String dropDownColor = "Màu sắc";
  String dropdownShape = "Hình dạng";

  //test

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
            // intro
            Container(
              padding: EdgeInsets.all(Dimensions.height15),
              child: AppText(
                text:
                    "Sử dụng công cụ tìm viên thuốc để xác định các loại thuốc bằng hình dáng bên ngoài hoặc màu sắc. Tất cả các trường đều là tùy chọn.",
                size: Dimensions.font18,
                fontWeight: FontWeight.normal,
              ),
            ),

            // query fill
            Container(
              width: Dimensions.boxSearchViewWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  color: Palette.mainBlueTheme.withOpacity(0.3),
                  width: 3,
                ),
              ),
              padding: EdgeInsets.all(Dimensions.height25),
              child: Column(
                children: [
                  // imprint query
                  TextFormField(
                    controller: txtCon,
                    style: TextStyle(
                      fontSize: Dimensions.font14,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15)),
                      hintText: 'Nhập mã thuốc',
                      hintStyle: TextStyle(
                        fontSize: Dimensions.font14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // colors
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 4, color: Palette.mainBlueTheme),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropDownColor,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                dropDownColor = newValue;
                              });
                            },
                            items: colors.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: AppTextTitle(
                                    text: value,
                                    size: Dimensions.font14,
                                    fontWeight: FontWeight.normal),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  /// Shapes
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 4, color: Palette.mainBlueTheme),
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius15,
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownShape,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(
                                () {
                                  dropdownShape = newValue;
                                },
                              );
                            },
                            items: shapes.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: AppTextTitle(
                                      text: value,
                                      size: Dimensions.font14,
                                      fontWeight: FontWeight.normal),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      );
                    },
                  ),

                  //search btn
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: Dimensions.boxViewWidth,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      color: Palette.mainBlueTheme,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius20,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // if (dropDownColor.startsWith(colors.first)) {}
                        // dropDownColor.startsWith(colors.first) ||
                        //         dropdownShape.startsWith(shapes.first)
                        //     ? Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               PillIdentifierListDrug(
                        //             query1: "",
                        //             query2: "",
                        //           ),
                        //         ))
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Chọn một thuộc tính bất kỳ'),
                        //     ),
                        //   )
                        // :
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PillIdentifierListDrug(
                              query1: dropDownColor,
                              query2: dropdownShape,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: Dimensions.icon24,
                            color: Palette.p1,
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          AppTextTitle(
                            text: "Tìm kiếm",
                            color: Palette.p1,
                            size: Dimensions.font14,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
