import 'package:flutter/material.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';
import '/pages/drawer-items/drug_index/widgets/drugA.dart';
import '/pages/drawer-items/drug_index/widgets/drugB.dart';
import '/pages/drawer-items/drug_index/widgets/drugC.dart';
import '/pages/drawer-items/drug_index/widgets/drugD.dart';
import '/pages/drawer-items/drug_index/widgets/drugE.dart';
import '/pages/drawer-items/drug_index/widgets/drugF.dart';
import '/pages/drawer-items/drug_index/widgets/drugG.dart';
import '/pages/drawer-items/drug_index/widgets/drugH.dart';
import '/pages/drawer-items/drug_index/widgets/drugI.dart';
import '/pages/drawer-items/drug_index/widgets/drugJ.dart';
import '/pages/drawer-items/drug_index/widgets/drugK.dart';
import '/pages/drawer-items/drug_index/widgets/drugL.dart';
import '/pages/drawer-items/drug_index/widgets/drugM.dart';
import '/pages/drawer-items/drug_index/widgets/drugN.dart';
import '/pages/drawer-items/drug_index/widgets/drugO.dart';
import '/pages/drawer-items/drug_index/widgets/drugP.dart';
import '/pages/drawer-items/drug_index/widgets/drugQ.dart';
import '/pages/drawer-items/drug_index/widgets/drugR.dart';
import '/pages/drawer-items/drug_index/widgets/drugS.dart';
import '/pages/drawer-items/drug_index/widgets/drugT.dart';
import '/pages/drawer-items/drug_index/widgets/drugU.dart';
import '/pages/drawer-items/drug_index/widgets/drugV.dart';
import '/pages/drawer-items/drug_index/widgets/drugW.dart';
import '/pages/drawer-items/drug_index/widgets/drugX.dart';
import '/pages/drawer-items/drug_index/widgets/drugY.dart';
import '/pages/drawer-items/drug_index/widgets/drugZ.dart';

class DrugIndex extends StatefulWidget {
  const DrugIndex({Key key}) : super(key: key);

  @override
  State<DrugIndex> createState() => _MedicineDictionaryState();
}

class _MedicineDictionaryState extends State<DrugIndex> {
  bool isSearching = false;
  String searchWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Danh sách chỉ mục thuốc',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 1.0),
            DefaultTabController(
              length: 26, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      labelPadding: EdgeInsets.symmetric (horizontal: 15),
                      tabs: [
                        Tab(text: 'A'),
                        Tab(text: 'B'),
                        Tab(text: 'C'),
                        Tab(text: 'D'),
                        Tab(text: 'E'),
                        Tab(text: 'F'),
                        Tab(text: 'G'),
                        Tab(text: 'H'),
                        Tab(text: 'I'),
                        Tab(text: 'J'),
                        Tab(text: 'K'),
                        Tab(text: 'L'),
                        Tab(text: 'M'),
                        Tab(text: 'N'),
                        Tab(text: 'O'),
                        Tab(text: 'P'),
                        Tab(text: 'Q'),
                        Tab(text: 'R'),
                        Tab(text: 'S'),
                        Tab(text: 'T'),
                        Tab(text: 'U'),
                        Tab(text: 'V'),
                        Tab(text: 'W'),
                        Tab(text: 'X'),
                        Tab(text: 'Y'),
                        Tab(text: 'Z'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height, //height of TabBarView
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        DrugA(),
                        DrugB(),
                        DrugC(),
                        DrugD(),
                        DrugE(),
                        DrugF(),
                        DrugG(),
                        DrugH(),
                        DrugI(),
                        DrugJ(),
                        DrugK(),
                        DrugL(),
                        DrugM(),
                        DrugN(),
                        DrugO(),
                        DrugP(),
                        DrugQ(),
                        DrugR(),
                        DrugS(),
                        DrugT(),
                        DrugU(),
                        DrugV(),
                        DrugW(),
                        DrugX(),
                        DrugY(),
                        DrugZ(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
