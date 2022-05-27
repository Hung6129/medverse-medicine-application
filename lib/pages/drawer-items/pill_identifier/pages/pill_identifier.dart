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
  List<String> pill_color_1 = [
    "Color 1",
    "ORANGE",
    "BLACK",
    "RED",
    "PINK",
    "BROWN",
    "TURQUOISE",
    "PURPLE",
    "WHITE",
    "YELLOW",
    "GREY",
    "GREEN",
    "BLUE",
  ];

// List of Color 2
  List<String> pill_color_2 = [
    "Color 2",
    "ORANGE",
    "BLACK",
    "RED",
    "PINK",
    "BROWN",
    "TURQUOISE",
    "PURPLE",
    "WHITE",
    "YELLOW",
    "GREY",
    "GREEN",
    "BLUE",
  ];

// List of Shapes
  List<String> pill_shapes = [
    'Shape',
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
    'Size',
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

  // Dropdown menu variable
  String dropDownColor1 = "Color 1";
  String dropDownColor2 = "Color 2";
  String dropdownShape = "Shape";
  String dropdownSize = "Size";
  String dropdownColor;

  @override
  Widget build(BuildContext context) {
    /// Title
    Widget __title() {
      return Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: Container(
          child: AppText(
            text:
                "Sử dụng công cụ tìm viên thuốc để xác định các loại thuốc bằng hình dáng bên ngoài hoặc màu sắc. Tất cả các trường đều là tùy chọn.",
            size: Dimensions.font18,
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
            hintText: 'Nhập kí tự trên thuốc',
            hintStyle: TextStyle(
              fontSize: Dimensions.font14,
            ),
          ),
        ),
      );
    }

    /// Color 1
    Widget __color1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 4, color: Palette.mainBlueTheme),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropDownColor1,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownColor1 = newValue;
                    });
                  },
                  items: pill_color_1.map((value) {
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

    /// Color 2
    Widget __color2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 4, color: Palette.mainBlueTheme),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropDownColor2,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownColor2 = newValue;
                    });
                  },
                  items: pill_color_2.map((value) {
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
              // String notShape = "Shape";
              // String notSize = "Size";
              // String notSelected1 = "Color 1";
              // String notSelected2 = "Color 2";

              // if (dropDownColor1 == notSelected1 &&
              //     dropDownColor2 == notSelected2 &&
              //     dropdownShape == notShape &&
              //     dropdownSize == notSize &&
              //     txtImprint.text.isEmpty) {
              //   print("Chon mot field de xem ket qua");
              // } else if (dropDownColor1 == notSelected1 &&
              //     dropDownColor2 != notSelected2) {
              //   dropdownColor = dropDownColor2;
              //   print("chua chon mau 1" +
              //       txtImprint.text +
              //       dropdownColor +
              //       dropdownShape +
              //       dropdownSize);
              // } else if (dropDownColor2 == notSelected2 &&
              //     dropDownColor1 != notSelected1) {
              //   dropdownColor = dropDownColor1;
              //   print("chua chon mau 2" +
              //       txtImprint.text +
              //       dropdownColor +
              //       dropdownShape +
              //       dropdownSize);
              // } else if (dropDownColor1 == notSelected1 &&
              //     dropDownColor2 == notSelected2) {
              //   dropdownColor = notSelected1;
              //   print("chua chon mau nao ca" +
              //       txtImprint.text +
              //       dropdownShape +
              //       dropdownSize +
              //       dropdownColor);
              // } else {
              //   print(txtImprint.text +
              //       dropdownColor +
              //       dropdownShape +
              //       dropdownSize);

              // }
              dropdownColor = dropDownColor1 + "," + dropDownColor2;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PillIdentifierListResult(
                    query1: txtImprint.text,
                    query2: dropdownColor,
                    query3: dropdownShape,
                    query4: dropdownSize,
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
      backgroundColor: Colors.white,
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
            Container(
              width: Dimensions.boxSearchViewWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    offset: Offset(5, 5),
                  ),
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(Dimensions.height10),

              /// All the field
              child: Column(
                children: [
                  __imprint(),
                  __color1(),
                  __color2(),
                  __shape(),
                  __size(),
                  __searchBtn()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
