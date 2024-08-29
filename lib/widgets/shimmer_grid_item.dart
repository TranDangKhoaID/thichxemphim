import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thichxemphim/widgets/shimmer.dart';

class ShimmerGridItem extends StatelessWidget {
  const ShimmerGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerImage(),
            //SizedBox(height: 8),
            ShimmerText(),
          ],
        ),
      ),
    );
  }
}
