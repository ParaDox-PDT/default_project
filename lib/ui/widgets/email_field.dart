import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';

class EmailField extends StatelessWidget {
  const EmailField(this.title, this.icon, {super.key});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: height * (50 / 812),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColors.C_1F5460.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
        cursorHeight: 20,
        cursorWidth: 1.4,
        cursorColor: AppColors.C_879EA4.withOpacity(0.2),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          border: InputBorder.none,
          icon: SvgPicture.asset(icon),
          hintText: title,
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.C_879EA4,
              fontFamily: "Sora"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
            const BorderSide(width: 1, color: AppColors.C_FFFFFF),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.C_FFFFFF,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.C_FFFFFF,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.C_FFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}
