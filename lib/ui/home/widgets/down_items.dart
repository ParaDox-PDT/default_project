import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';

class DownItems extends StatelessWidget {
  const DownItems({super.key, required this.title, required this.img});
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(title,style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.C_64748B,
            fontFamily: "Poppins",
            letterSpacing: 0.2,
            height: 1.5),),
        SizedBox(width: width*(8/375),),
        SvgPicture.asset(img),
      ],
    );
  }
}
