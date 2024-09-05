import 'package:flutter/material.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/models/category.dart';
import 'package:thichxemphim/widgets/wrap_category_movie.dart';

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
        WrapCategoryMovie(items: items),
      ],
    );
  }
}
