import 'package:flutter/material.dart';
import '/widgets/typeahead/typeahead_search_bar.dart';
import '/pages/drawer-items/compare_drugs/pages/compare_result.dart';
import '/theme/palette.dart';

class CompareDrug extends StatefulWidget {
  const CompareDrug({Key key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<CompareDrug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'So sánh thuốc',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              decoration: BoxDecoration(
                color: Palette.textNo.withAlpha(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Xem tác dụng của chúng sẽ như thế nào khi dùng chung',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   child: TypeAheadSearchBar(),
                  // ),
                  SizedBox(height: 30),
                  Container(
                    height: 150,
                    width: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/compare-hero-bg.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "So sánh phổ biến",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    "So sánh các loại thuốc hàng đầu theo tình trạng y tế, tác dụng phụ, xếp hạng và đánh giá.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CompareResult(),
                    ),
                  );
                },
                child: new Text("Tylenol và Paranol"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
