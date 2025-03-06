import 'package:circletraning/features/products/ui/widgets/item_of_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfCategoryItem extends StatefulWidget {
  const ListOfCategoryItem({
    super.key,
  });

  @override
  State<ListOfCategoryItem> createState() => _ListOfCategoryItemState();
}

class _ListOfCategoryItemState extends State<ListOfCategoryItem> {
  int _currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: ItemOfCategoryProduct(
                  isActive: _currentIndex == index,
                ),
              ),
          itemCount: 10),
    );
  }
}
