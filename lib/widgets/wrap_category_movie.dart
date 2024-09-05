import 'package:flutter/material.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/models/category.dart';

class WrapCategoryMovie extends StatelessWidget {
  const WrapCategoryMovie({
    super.key,
    required this.items,
  });

  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      //alignment: WrapAlignment.start,
      children: List.generate(
        items.length,
        (index) => IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ShareColors.kSecondColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.topLeft,
            //width: handleWidthCategory(items, context),
            child: Text('#${items[index].name}'),
          ),
        ),
      ),
    );
  }
}

double handleWidthCategory(List items, BuildContext context) {
  double width = 0;
  if (items.length == 1) {
    width = MediaQuery.of(context).size.width - 20;
  } else if (items.length == 2) {
    width = (MediaQuery.of(context).size.width - 20) * 0.45;
  } else {
    width = (MediaQuery.of(context).size.width - 20) * 0.3;
  }
  return width;
}
