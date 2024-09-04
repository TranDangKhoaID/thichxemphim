import 'package:flutter/material.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/models/category.dart';

class ContentCategory extends StatelessWidget {
  const ContentCategory({super.key, required this.items});

  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thể loại: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: List.generate(
            items.length,
            (index) => Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ShareColors.kSecondColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              width: handleWidthCategory(items, context),
              child: Text('#${items[index].name}'),
            ),
          ),
        )
      ],
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
