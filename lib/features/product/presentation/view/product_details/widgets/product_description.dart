import 'package:bazarly_app/core/utils/colors/app_colors.dart';
import 'package:bazarly_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Product description section with a "Read More" toggle.
class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.descreption});
  final String descreption;

  // Controls whether the full description is shown or truncated

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Description',
          style: AppStyles.bodySmallSb.copyWith(
            color: AppColors.primary,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(height: 6.h),

        Text(descreption,
        style:  AppStyles.bodyXSmallRg.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11.sp,
            ),
        
        )

        // Description text with "Read More" / "Read Less" toggle
        // RichText(
        //   text: TextSpan(
        //     style: AppStyles.bodyXSmallRg.copyWith(
        //       color: AppColors.textSecondary,
        //       fontSize: 11.sp,
        //     ),
        //     children: [
        //       TextSpan(
        //         // TODO: replace with product.description
        //         text: 
        //       ),
              
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
