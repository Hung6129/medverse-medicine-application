import '/widgets/app_text_title.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';

import 'pill_identifier_result.dart';

class Identifier extends StatefulWidget {
  const Identifier({Key key}) : super(key: key);

  @override
  _IdentifierState createState() => _IdentifierState();
}

class _IdentifierState extends State<Identifier> {
// Imprint input controller
  TextEditingController txtCon = TextEditingController();

// List of Color 1
  List<String> pill_color_1 = [
    "Màu sắc 1",
    "CAM",
    "ĐEN",
    "ĐỎ",
    "HỒNG",
    "NÂU",
    "NGỌC LAM",
    "TÌM",
    "TRẮNG",
    "VÀNG",
    "XÁM",
    "XANH LÁ",
    "XANH",
  ];

// List of Color 1
  List<String> pill_color_2 = [
    "Màu sắc 2",
    "CAM",
    "ĐEN",
    "ĐỎ",
    "HỒNG",
    "NÂU",
    "NGỌC LAM",
    "TÌM",
    "TRẮNG",
    "VÀNG",
    "XÁM",
    "XANH LÁ",
    "XANH",
  ];

// List of Shapes
  List<String> pill_shapes = [
    'Hình dạng',
    "BÁN NGUYỆT",
    "CHỮ NHẬT",
    "CON NHỘNG",
    "GIỌT NƯỚC",
    "HAI VÒNG TRÒN",
    "HÌNH DẠNG KHÔNG XÁC ĐỊNH",
    "HÌNH THANG",
    "HÌNH TRÁI XOAN",
    "KIM CƯƠNG",
    "LỤC GIÁC (5 CẠNH)",
    "LỤC GIÁC (6 CẠNH)",
    "TAM GIÁC",
    "TÁM GOC (8 CẠNH)",
    "TRÒN",
    "VIÊN ĐẠN",
    "VUÔNG",
  ];

// List of Size
  List<String> pill_sizes = [
    'Kích thước',
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
  String dropDownColor1 = "Màu sắc 1";
  String dropDownColor2 = "Màu sắc 2";
  String dropdownShape = "Hình dạng";
  String dropdownSize = "Kích thước";

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
            // Intro
            Container(
              padding: EdgeInsets.all(Dimensions.height15),
              child: AppText(
                text:
                    "Sử dụng công cụ tìm viên thuốc để xác định các loại thuốc bằng hình dáng bên ngoài hoặc màu sắc. Tất cả các trường đều là tùy chọn.",
                size: Dimensions.font18,
                fontWeight: FontWeight.normal,
              ),
            ),

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
              padding: EdgeInsets.all(Dimensions.height25),
              child: Column(
                children: [
                  // Imprint query
                  TextFormField(
                    controller: txtCon,
                    style: TextStyle(
                      fontSize: Dimensions.font14,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15)),
                      hintText: 'Nhập kí tự trên thuốc',
                      hintStyle: TextStyle(
                        fontSize: Dimensions.font14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // Colors
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

                  // Color2
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
                            items: pill_shapes.map(
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
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  /// Size
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
                            builder: (context) => PillIdentifierListResult(
                              query1: txtCon.text,
                              query2: dropDownColor1,
                              query3: dropDownColor2,
                              query4: dropdownShape,
                              query5: dropdownSize,
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
