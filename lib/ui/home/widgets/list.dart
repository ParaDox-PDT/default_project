import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class TextList extends StatelessWidget {
  const TextList({super.key, required this.text1, required this.text2, required this.text3, required this.img, required this.title});
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String img;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 14),
      width: double.infinity,
      height: height * (160 / 812),
      color: AppColors.C_4229A2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.white),
          ),
          SizedBox(
            height: height * (12 / 812),
          ),
          Row(children: [
            SvgPicture.asset(img),
            const SizedBox(
              width: 4,
            ),
            Text(
              text1,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontFamily: "Montserrat"),
            )
          ]),
          SizedBox(
            height: height * (10 / 812),
          ),
          Row(children: [
            SvgPicture.asset(img),
            const SizedBox(
              width: 4,
            ),
            Text(
              text2,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontFamily: "Montserrat"),
            )
          ]),
          SizedBox(
            height: height * (10 / 812),
          ),
          Row(children: [
            SvgPicture.asset(img),
            const SizedBox(
              width: 4,
            ),
            Text(
              text3,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontFamily: "Montserrat"),
            )
          ]),
        ],
      ),
    );
  }
}
