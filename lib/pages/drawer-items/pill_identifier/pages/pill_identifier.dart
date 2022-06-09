import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';

import 'pill_identifier_result.dart';

class PillIdentifier extends StatefulWidget {
  const PillIdentifier({Key key}) : super(key: key);

  @override
  _PillIdentifierState createState() => _PillIdentifierState();
}

class _PillIdentifierState extends State<PillIdentifier> {
// Imprint input controller
  TextEditingController txtImprint = TextEditingController();

// List of Color 1
  // List<String> pill_color_1 = [
  //   "ORANGE",
  //   "BLACK",
  //   "RED",
  //   "PINK",
  //   "BROWN",
  //   "TURQUOISE",
  //   "PURPLE",
  //   "WHITE",
  //   "YELLOW",
  //   "GREY",
  //   "GREEN",
  //   "BLUE",
  // ];

// List of Color 2
  // List<String> pill_color_2 = [
  //   "ORANGE",
  //   "BLACK",
  //   "RED",
  //   "PINK",
  //   "BROWN",
  //   "TURQUOISE",
  //   "PURPLE",
  //   "WHITE",
  //   "YELLOW",
  //   "GREY",
  //   "GREEN",
  //   "BLUE",
  // ];

// List of Shapes
  List<String> pill_shapes = [
    "CAPSULE",
    "OVAL",
    "TEAR",
    "ROUND",
    "HEXAGON(6sided)",
    "SQUARE",
    "TRIANGLE",
    "PENTAGON(5sided)",
    "DIAMOND",
    "RECTANGLE",
    "SEMI-CIRCLE",
    "DOUBLECIRCLE",
    "TRAPEZOID",
    "FREEFORM",
    "NEED ATTENTION",
    "BULLET",
  ];

// List of Size
  List<String> pill_sizes = [
    "4mm",
    "5mm",
    "6mm",
    "7mm",
    "8mm",
    "9mm",
    "10mm",
    "11mm",
    "12mm",
    "13mm",
    "14mm",
    "15mm",
    "16mm",
    "17mm",
    "18mm",
    "19mm",
    "20mm",
    "21mm",
    "22mm",
    "23mm",
    "24mm",
    "25mm",
    "26mm",
    "27mm",
  ];

  String dropdownShape;
  String dropdownSize;
  String dropdownColor;

  List<String> pillColor = [
    "BLACK",
    "BLACK,GREEN",
    "BLACK,PINK",
    "BLACK,PURPLE",
    "BLACK,TURQUOISE",
    "BLACK,WHITE",
    "BLACK,YELLOW",
    "BLUE",
    "BLUE,BLUE",
    "BLUE,BROWN",
    "BLUE,GRAY",
    "BLUE,GREEN",
    "BLUE,ORANGE",
    "BLUE,PINK",
    "BLUE,RED",
    "BLUE,TURQUOISE",
    "BLUE,WHITE",
    "BLUE,YELLOW",
    "BROWN",
    "BROWN,ORANGE",
    "BROWN,PINK",
    "BROWN,WHITE",
    "BROWN,YELLOW",
    "GRAY",
    "GRAY,BLUE",
    "GRAY,BROWN",
    "GRAY,GREEN",
    "GRAY,ORANGE",
    "GRAY,PINK",
    "GRAY,PURPLE",
    "GRAY,RED",
    "GRAY,WHITE",
    "GRAY,YELLOW",
    "GREEN",
    "GREEN,BLACK",
    "GREEN,BLUE",
    "GREEN,BROWN",
    "GREEN,GRAY",
    "GREEN,GREEN",
    "GREEN,ORANGE",
    "GREEN,PINK",
    "GREEN,PURPLE",
    "GREEN,TURQUOISE",
    "GREEN,WHITE",
    "GREEN,YELLOW",
    "ORANGE",
    "ORANGE,BLUE",
    "ORANGE,BROWN",
    "ORANGE,GRAY",
    "ORANGE,ORANGE",
    "ORANGE,TURQUOISE",
    "ORANGE,WHITE",
    "ORANGE,YELLOW",
    "PINK",
    "PINK,BLACK",
    "PINK,BLUE",
    "PINK,BROWN",
    "PINK,GREEN",
    "PINK,ORANGE",
    "PINK,PINK",
    "PINK,RED",
    "PINK,WHITE",
    "PINK,YELLOW",
    "PURPLE",
    "PURPLE,GRAY",
    "PURPLE,ORANGE",
    "PURPLE,PINK",
    "PURPLE,PURPLE",
    "PURPLE,TURQUOISE",
    "PURPLE,WHITE",
    "PURPLE,YELLOW",
    "RED",
    "RED,BLUE",
    "RED,ORANGE",
    "RED,PINK",
    "RED,RED",
    "RED,WHITE",
    "RED,YELLOW",
    "TURQUOISE",
    "TURQUOISE,GRAY",
    "TURQUOISE,GREEN",
    "TURQUOISE,PURPLE",
    "TURQUOISE,WHITE",
    "WHITE",
    "WHITE,BLACK",
    "WHITE,BLUE",
    "WHITE,BROWN",
    "WHITE,GRAY",
    "WHITE,GREEN",
    "WHITE,ORANGE",
    "WHITE,PINK",
    "WHITE,PURPLE",
    "WHITE,RED",
    "WHITE,TURQUOISE",
    "WHITE,WHITE",
    "WHITE,YELLOW",
    "YELLOW",
    "YELLOW,BLACK",
    "YELLOW,BLUE",
    "YELLOW,GRAY",
    "YELLOW,GREEN",
    "YELLOW,ORANGE",
    "YELLOW,PINK",
    "YELLOW,PURPLE",
    "YELLOW,RED",
    "YELLOW,WHITE",
    "YELLOW,YELLOW",
  ];
  @override
  Widget build(BuildContext context) {
    /// Title
    Widget __title() {
      return Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 25),
        child: Container(
          child: AppText(
            text:
                "Sử dụng công cụ tìm viên thuốc để xác định các loại thuốc bằng hình dáng bên ngoài hoặc màu sắc. Tất cả các trường đều là tùy chọn.",
            size: Dimensions.font18,
            color: Palette.mainBlueTheme,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    /// Imprint
    Widget __imprint() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: txtImprint,
          style: TextStyle(
            fontSize: Dimensions.font14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15)),
            hintText: 'Input a imprint',
            hintStyle: TextStyle(
              fontSize: Dimensions.font14,
            ),
          ),
        ),
      );
    }

    /// Color 1
    Widget __color() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.color_filter),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 4, color: Palette.mainBlueTheme),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownColor,
                  hint: AppText(
                    text: "Pick a color",
                    size: Dimensions.font14,
                  ),
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownColor = newValue;
                    });
                  },
                  items: pillColor.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: AppText(
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
      );
    }

    /// Shape
    Widget __shape() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.rectangle_3_offgrid),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 4, color: Palette.mainBlueTheme),
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius15,
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownShape,
                  hint: AppText(
                    text: "Pick a shape",
                    size: Dimensions.font14,
                  ),
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(
                      () {
                        dropdownShape = newValue;
                      },
                    );
                  },
                  items: pill_shapes.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: AppText(
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
      );
    }

    /// Size
    Widget __size() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.arrow_left_right_circle),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 4, color: Palette.mainBlueTheme),
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius15,
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownSize,
                  hint: AppText(
                    text: "Pick a size",
                    size: Dimensions.font14,
                  ),
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(
                      () {
                        dropdownSize = newValue;
                      },
                    );
                  },
                  items: pill_sizes.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: AppText(
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
      );
    }

    /// Search btn
    Widget __searchBtn() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
              if (dropdownColor == null &&
                  dropdownShape == null &&
                  dropdownSize == null &&
                  txtImprint.text.isEmpty) {
                print("Chon mot field de xem ket qua");
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    backgroundColor: Palette.warningColor,
                    message:
                        "Please check did you pick any field yet and try again",
                  ),
                );
              } else {
                String blank = "".trim();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PillIdentifierListResult(
                      query1: txtImprint.text,
                      query2: dropdownColor == null ? blank : dropdownColor,
                      query3: dropdownShape == null ? blank : dropdownShape,
                      query4: dropdownSize == null ? blank : dropdownSize,
                    ),
                  ),
                );
                // print(dropdownColor == null
                //     ? blank
                //     : dropdownColor + dropdownShape == null
                //         ? blank
                //         : dropdownShape + dropdownSize == null
                //             ? blank
                //             : dropdownSize);

              }
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
                AppText(
                  text: "Tìm kiếm",
                  color: Palette.p1,
                  size: Dimensions.font14,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // backgroundColor: Colors.white,
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
            __title(),

            // Query fill box
            Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 15,
                lightSource: LightSource.top,
                color: Colors.white,
              ),
              child: Container(
                width: Dimensions.boxSearchViewWidth,

                /// All the field
                child: Column(
                  children: [
                    __imprint(),
                    __color(),
                    __shape(),
                    __size(),
                    __searchBtn(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
