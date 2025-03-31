import 'package:circletraning/features/home/ui/widget/product_item.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DynamicHeightGridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          builder: (context, index) => const ProductItem(),
          itemCount: 10,
          crossAxisCount: 2),
    );
  }
}
