import 'package:flutter/material.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';

class Disclaimer extends StatefulWidget {
  const Disclaimer({Key key}) : super(key: key);

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Palette.mainBlueTheme,
      title: Text(
        'Miễn trừ trách nhiệm',
        style: MobileTextTheme().appBarStyle,
      ),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dịch vụ này được thiết kế để người tiêu dùng tại Việt Nam sử dụng. Bằng cách sử dụng ứng dụng này, bạn phải đọc và chấp nhận các điều khoản sau.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Các tính năng và nội dung trong ứng dụng này, Tìm Kiếm Nâng Cao  và Tìm Kiếm Thuốc không nhằm thay thế cho lời khuyên y tế chuyên nghiệp, điều trị chẩn đoán. các vấn đề liên quan. Đừng bỏ qua hoặc chậm trễ trong việc nhận lời khuyên y tế chuyên nghiệp do bất kỳ thông tin nào bạn có được từ ứng dụng này. Thông tin được cung cấp trong ứng dụng Nhận dạng Thuốc và Tìm kiếm Thuốc chỉ dành cho mục đích giáo dục chứ không phải để điều trị hoặc chẩn đoán bất kỳ tình trạng sức khỏe nào.',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhà xuất bản, tác giả hoặc bất kỳ nhà cung cấp dữ liệu bên thứ ba nào được liên kết với ứng dụng này không có bất kỳ trách nhiệm nào đối với việc sử dụng thông tin được cung cấp trong ứng dụng này. Không có đảm bảo nào được đưa ra về tính hiệu quả, hiệu suất hoặc độ chính xác của thông tin được cung cấp trong ứng dụng hoặc bởi bất kỳ nguồn dữ liệu bên thứ ba nào.',
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
