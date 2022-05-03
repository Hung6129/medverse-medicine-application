import 'package:flutter/material.dart';
import '/theme/palette.dart';
import '/utils/breakpoints.dart';
import '/pages/drawer-items/compare_drugs/widgets/item_card.dart';
import '/pages/drawer-items/compare_drugs/widgets/item_card_layout_grid.dart';

class FeaturedTutorialsContent extends StatelessWidget {
  const FeaturedTutorialsContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount =
    screenWidth >= Breakpoints.twoColLayoutMinWidth ? 2 : 2;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 0.0),
      child: ItemCardLayoutGrid(
        crossAxisCount: crossAxisCount,
        items: ItemCardData.allItemsData,
      ),
    );
  }
}
