import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';


class LoginWith extends StatelessWidget {
  const LoginWith({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      width: width*(44/307.5),
      height: width*(44/307.5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,color: AppColors.white
      ),
      child: SvgPicture.asset(img),
    );
  }
}
