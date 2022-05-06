import '/theme/palette.dart';
import '/utils/app_text_theme.dart';
import '/utils/breakpoints.dart';
import '/utils/constants.dart';
import '/pages/drawer-items/compare_drugs/widgets/border_mouse_hover.dart';
import '/utils/tags.dart';
import 'package:flutter/material.dart';

class ItemCardData {
  final String imageName;
  final String title;
  final String description;
  final List<String> tags;
  final String metadata1;
  final String metadata2;

  const ItemCardData({
    this.imageName,
    this.title,
    this.description,
    this.tags,
    this.metadata1,
    this.metadata2,
  });

  static const allItemsData = [
    ItemCardData(
      imageName: Constants.tutorial1,
      title: 'How to Parse JSON in Dart/Flutter: The Essential Guide',
      description:
          'Learn how to parse JSON and define type-safe model classes that can handle validation, nullable/optional values, and complex/nested JSON data',
      tags: ['dart', 'flutter', 'networking', 'json'],
      metadata1: 'AUG 19, 2021',
      metadata2: '16 MIN READ',
    ),
    ItemCardData(
      imageName: Constants.tutorial2,
      title: 'Side Effects in Flutter: What they are and how to avoid them',
      description:
          'Mutating state or calling async code inside the build method can cause unwanted widget rebuilds and unintended behaviour. Here are some examples and rules to follow.',
      tags: ['dart', 'flutter', 'state-management'],
      metadata1: 'AUG 03, 2021',
      metadata2: '7 MIN READ',
    ),
  ];
}

class ItemCard extends StatelessWidget {
  final ItemCardData data;

  const ItemCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth >= Breakpoints.tablet ? 32.0 : 20.0;
    final verticalPadding = screenWidth >= Breakpoints.tablet ? 24.0 : 16.0;
    return BorderMouseHover(
      builder: (context, value) => Column(
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: DecoratedBox(
              // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(data.imageName),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ItemMetadataWidget(
                    startText: data.metadata1, endText: data.metadata2),
                if (data.tags.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ItemMetadataTags(tags: data.tags),
                  const SizedBox(height: 20),
                ] else
                  const SizedBox(height: 18),
                Text(
                  data.description,
                  // TODO: Responsive?
                  style: MobileTextTheme()
                      .paragraph18
                      .copyWith(color: Palette.neutral2, height: 1.666),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMetadataWidget extends StatelessWidget {
  final String startText;
  final String endText;

  const ItemMetadataWidget({
    Key key,
    this.startText,
    this.endText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Responsive with LayoutBuilder
    return Text(
      '$startText | $endText',
      textAlign: TextAlign.left,
      style:
      MobileTextTheme().subheadAllCaps.copyWith(color: Palette.neutral2),
    );
    // TODO: Would be nice to make this work without overflow
    return Row(
      children: [
        Text(
          startText,
          style: MobileTextTheme()
              .subheadAllCaps
              .copyWith(color: Palette.neutral2),
        ),
        const SizedBox(width: 10),
        Container(
          height: 16,
          width: 1,
          color: Palette.neutral2,
        ),
        const SizedBox(width: 10),
        Text(
          endText,
          overflow: TextOverflow.clip,
          style: MobileTextTheme()
              .subheadAllCaps
              .copyWith(color: Palette.neutral2),
        ),
      ],
    );
  }
}

class ItemMetadataTags extends StatelessWidget {
  final List<String> tags;

  const ItemMetadataTags({
    Key key,
    this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 0,
      children: [
        for (final tag in tags)
          Chip(
            backgroundColor: tag.color().backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            label: Text(
              tag,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.normal, color: tag.color().color),
            ),
          ),
      ],
    );
  }
}
