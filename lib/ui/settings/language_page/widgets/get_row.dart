import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class GetRow extends StatelessWidget {
  const GetRow({super.key, required this.title, required this.img});
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          img,
          width: width*(40/375),
        ),
        SizedBox(
          width: width * (20 / 375),
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.C_0F172A),
        ),
      ],
    );
  }
}
