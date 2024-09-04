import 'package:flutter/material.dart';

class ContentActor extends StatelessWidget {
  const ContentActor({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Diễn viên: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: List.generate(
            items.length,
            (index) => Container(
              alignment: Alignment.topLeft,
              width: handleWidthActor(items, context),
              child: Text(
                items[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

double handleWidthActor(List items, BuildContext context) {
  double width = 0;
  if (items.length == 1) {
    width = MediaQuery.of(context).size.width - 0.95;
  } else {
    width = (MediaQuery.of(context).size.width - 20) * 0.45;
  }
  return width;
}
