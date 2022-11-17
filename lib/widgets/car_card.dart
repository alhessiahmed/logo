import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.isFav,
    required this.id,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final String subtitle;
  final String rating;
  final bool isFav;
  final int id;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(
              id: id,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Image.asset(
                    imgUrl,
                    width: 166.w,
                    height: 141.h,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  top: 8.h,
                  end: 8.h,
                  child: InkWell(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 16.r,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  AutoSizeText(
                    title,
                    style: AppTextStyles.textStyle14,
                  ),
                  const Spacer(),
                  Image.asset('assets/images/star.png'),
                  SizedBox(
                    width: 4.w,
                  ),
                  AutoSizeText(
                    rating,
                    style: AppTextStyles.textStyle12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AutoSizeText(
                subtitle,
                style: AppTextStyles.darkGreenTextStyle14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
