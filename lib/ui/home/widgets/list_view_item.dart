import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.img, required this.title, required this.subtitle, required this.price, required this.count, required this.onTapPlus, required this.onTapMinus});
  final String img;
  final String title;
  final String subtitle;
  final int price;
  final int count;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * (344 / 375),
      height: height * (96 / 812),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.C_22222A),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              img,
              width: width * (88 / 375),
              height: height * (68 / 812),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                SizedBox(
                  width: width*(236/375),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.C_6A6A6E,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "₽${price.toString()}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * (90 / 375),
                  height: height * (34 / 812),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.C_19191D),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink(
                        child: InkWell(
                          onTap: (){
                            onTapPlus();
                          },
                          child: SvgPicture.asset(AppImages.plus),
                        ),
                      ),
                      Text(count.toString(),style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          fontFamily: "Inter"),),
                      Ink(
                        child: InkWell(
                          onTap: (){
                            onTapMinus();
                          },
                          child: SvgPicture.asset(AppImages.minus),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
