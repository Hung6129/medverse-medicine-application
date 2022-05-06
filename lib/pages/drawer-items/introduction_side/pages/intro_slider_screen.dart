import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/utils/app_text_theme.dart';
import '/theme/palette.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Hướng dẫn sử dụng',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            /// Introduction title
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đây là hướng dẫn sử dụng cho các phần khác nhau của ứng dụng',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Favourite title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.square_favorites_alt_fill,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Danh sách yêu thích',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Favourite description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trong trang chi tiết của bất kỳ loại thuốc nào, bạn có thể tìm thấy biểu tượng "Thích" ở bên trái dưới cùng. Bằng cách nhấn vào nó, bạn có thể đánh dấu loại thuốc đó, để tham khảo nó sau này. Các loại thuốc bạn đánh dấu theo cách này sẽ được lưu trong phần "Danh sách yêu thích". Bất cứ khi nào bạn muốn xem chi tiết về các loại thuốc bạn đã đánh dấu, hãy mở phần "Danh sách yêu thích".',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug search title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.search_circle_fill,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tìm kiếm thuốc',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Drug search description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhập tên loại thuốc bạn đang tìm kiếm vào thanh tìm kiếm. Nếu bạn đang tìm kiếm các loại thuốc theo tên, hãy nhập tên thuốc vào thanh tìm kiếm.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Pill identifier title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.zoom_in,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tìm kiếm nâng cao',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Pill identifier description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Công cụ này giúp bạn phát hiện một loại thuốc theo màu sắc, hình dạng và kích thước của nó. Nếu bạn muốn biết chi tiết về một loại thuốc bằng các tính năng này thì ứng dụng sẽ giúp bạn. Đôi khi mọi người quên tên của một loại thuốc và cố gắng tìm ra nó bằng màu sắc của nó. Với ứng dụng này, bạn có thể xác định một loại thuốc bằng màu sắc, hình dạng và kích thước của nó. Cung cấp màu sắc, hình dạng và kích thước của thuốc trong công cụ nhận dạng viên thuốc và bạn sẽ sớm biết tên thuốc. Bây giờ nếu bạn nhấp vào tên thuốc thì nó sẽ dẫn bạn đến trang chi tiết của thuốc.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// BMI calculator title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.calculate_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tính chỉ số BMI',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// BMI calculator description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tính chỉ số BMI là một giá trị được tính bằng cân nặng và chiều cao của một cá nhân. Tính toán này thay đổi khi cơ thể già đi. Mục đích của phép tính này là để xác định xem trọng lượng cơ thể bạn có chính xác với chiều cao của bạn hay không và cũng cho bạn biết liệu bạn có bị nguy cơ sức khỏe hay không.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug report title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_camera_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Báo cáo thuốc đến Admin',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Drug report description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nếu bạn tìm kiếm thuốc trên app mà không có loại thuốc mình đang tìm kiếm. Bạn có thể dùng chúc năng báo cáo thuốc đến Admin để chụp ảnh và viết mô tả gửi đến Admin. Admin sẽ xem xét và cập nhật thông tin loại thuốc mới.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug interaction title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.do_disturb_alt_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tương kị thuốc',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Drug interaction description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đây là loại tương kị thuốc phổ biến nhất. Bạn càng dùng nhiều loại thuốc, cơ hội để thuốc của bạn tương tác với một loại thuốc khác càng lớn. Tương kị thuốc - thuốc có thể làm giảm hiệu quả hoạt động của thuốc, có thể làm tăng các tác dụng phụ không mong muốn nhẹ hoặc nghiêm trọng, hoặc thậm chí làm tăng nồng độ thuốc trong máu và độc tính có thể có của một loại thuốc nhất định. Công cụ này giúp bạn có thể tra cưu tính tương kị giữa 2 loại thuốc.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug report description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nếu bạn tìm kiếm thuốc trên app mà không có loại thuốc mình đang tìm kiếm. Bạn có thể dùng chúc năng báo cáo thuốc đến Admin để chụp ảnh và viết mô tả gửi đến Admin. Admin sẽ xem xét và cập nhật thông tin loại thuốc mới.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug comparison title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.compare_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'So sánh thuốc',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Drug comparison description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Xem cách các loại thuốc của bạn xếp chồng lên nhau. Xem các so sánh song song về việc sử dụng thuốc, xếp hạng và đánh giá, giá cả, cảnh báo của FDA, tác dụng phụ, tương tác thuốc, ngày phê duyệt, phân loại, tính khả dụng chung và hơn thế nữa.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Drug dictionary title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list_alt_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Từ điển y học',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Drug dictionary description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Xem cách các loại thuốc của bạn xếp chồng lên nhau. Xem các so sánh song song về việc sử dụng thuốc, xếp hạng và đánh giá, giá cả, cảnh báo của FDA, tác dụng phụ, tương tác thuốc, ngày phê duyệt, phân loại, tính khả dụng chung và hơn thế nữa.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Health profile title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.health_and_safety_outlined,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hồ sơ sức khỏe',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Health profile description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hồ sơ sức khỏe là tập hợp các chỉ số về tình trạng sức khỏe cơ bản như: chiều cao, cân nặng, BMI, huyết áp, nhịp tim, nhóm máu. Bạn có thể cập nhật các chỉ số bằng cách ấn vào mục tương ứng và nhập chỉ số phù hợp với sức khỏe của bạn. Ngoài ra hồ sơ sức khỏe còn chứa các thông tin cá nhân cơ bản.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Social drug post title
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.news_solid,
                    color: Palette.textNo,
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mạng xã hội',
                        style: MobileTextTheme().introTitleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Social drug post description content
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đây là một chức năng cho phép bạn có thể đăng bài viết về thuốc nhằm mục đích chia sẻ thuốc bạn đang sử đến với mọi người. Những người xem khác có thể "Thích" hoặc "Bình luận lên bài viết của bạn."',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
