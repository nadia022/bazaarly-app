import 'package:bazarly_app/features/product/presentation/view/product_tab_view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabViewBody extends StatelessWidget {
  const ProductTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: GridView.builder(
        // 2-column grid matching the design
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          // Fixed height per card instead of aspect ratio —
          // prevents overflow when text size or screen density varies
          mainAxisExtent: 260.h,
        ),
        // TODO: replace with products.length from Bloc
        itemCount: 15,
        itemBuilder: (context, index) {
          // TODO: pass actual ProductModel here
          return const ProductCard();
        },
      ),
    );
  }
}