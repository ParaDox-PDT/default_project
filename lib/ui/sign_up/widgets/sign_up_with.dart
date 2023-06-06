import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key, required this.text, required this.img, required this.imgWidth, required this.imgHeight});
  final String text;
  final String img;
  final double imgWidth;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*(152/375),
      height: height*(56/812),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColors.C_22222A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img,width: imgWidth,height: imgHeight,),
          SizedBox(
            width: width * (12 / 375),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.white,
                fontFamily: "Poppins"),
          )
        ],
      ),
    );
  }
}
