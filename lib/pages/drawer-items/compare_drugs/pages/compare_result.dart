import 'package:flutter/material.dart';
import '/pages/drawer-items/compare_drugs/widgets/featured_tutorials_content.dart';

class CompareResult extends StatelessWidget {
  const CompareResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FeaturedTutorialsContent(),
            ),
          ],
        ),
      ),
    );
  }
}
