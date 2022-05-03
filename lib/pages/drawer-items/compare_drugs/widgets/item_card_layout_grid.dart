import '/pages/drawer-items/compare_drugs/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Grid layout with content-sized items
// See: https://codewithandrea.com/articles/flutter-layout-grid-content-sized-items/
class ItemCardLayoutGrid extends StatelessWidget {
  final int crossAxisCount;
  final List<ItemCardData> items;

  const ItemCardLayoutGrid({
    Key key,
    this.crossAxisCount,
    this.items,
  })

  /// We only plan to use this with 1 or 2 columns
  : assert(crossAxisCount == 1 || crossAxisCount == 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final rowSizes = List.generate(items.length ~/ crossAxisCount, (_) => auto);
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: rowSizes,
      rowGap: 0,
      // equivalent to mainAxisSpacing
      columnGap: 0,
      // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      children: [
        // render all the cards with *automatic child placement*
        for (var i = 0; i < items.length; i++) ItemCard(data: items[i]),
      ],
    );
  }
}

// Alternative implementation using GridView
//
// For demonstration purposes only
class ItemCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final EdgeInsets padding;
  final List<ItemCardData> items;

  const ItemCardGridView({
    Key key,
    this.crossAxisCount,
    this.padding,
    this.items,
  })
  // we only plan to use this with 1 or 2 columns
  : assert(crossAxisCount == 1 || crossAxisCount == 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.75, // width / height
      ),
      itemBuilder: (context, i) => ItemCard(data: items[i]),
      itemCount: items.length,
    );
  }
}
