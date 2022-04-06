import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import '/widgets/typeahead_search_bar.dart';
import 'package:flutter/material.dart';

class InteractionChecker extends StatefulWidget {
  const InteractionChecker({Key key}) : super(key: key);

  @override
  _InteractionCheckerState createState() => _InteractionCheckerState();
}

class _InteractionCheckerState extends State<InteractionChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kiểm tra tương kị thuốc',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              child: AppText(
                text:
                    "Bắt đầu nhập tên loại thuốc và chọn loại thuốc phù hợp nhất từ danh sách gợi ý. Lặp lại quy trình để thêm nhiều loại thuốc. Sau khi danh sách của bạn hoàn tất, bạn có thể kiểm tra các tương tác ngay lập tức.",
                color: Palette.textNo,
                size: Dimensions.font18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  color: Palette.mainBlueTheme,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(Dimensions.height10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeAheadSearchBar(),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Palette.whiteText),
                    child: TextButton(
                      onPressed: () {},
                      child: AppText(
                        text: "Thêm",
                        color: Palette.mainBlueTheme,
                        size: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.mainBlueTheme,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/drugsDetails");
                      },
                      child: AppText(
                        text: "Tìm kiếm",
                        color: Palette.whiteText,
                        size: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
