import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: width * (40 / 375),
        height: height * (40 / 375),
        decoration: ShapeDecoration(
            shape: CircleBorder(), color: AppColors.C_F1F5F9),
        child: Center(
          child: SvgPicture.asset(icon),
        ),
      ),
      trailing: SvgPicture.asset(AppImages.next),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.C_0F172A,
            fontFamily: "Poppins",letterSpacing: 0.2),
      ),
      onTap: onTap,
    );
  }
}
