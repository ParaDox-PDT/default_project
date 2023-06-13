import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class GlobalListItems extends StatelessWidget {
  const GlobalListItems({super.key, required this.title, required this.onTap});
  final String  title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(title:  Text(title,style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.C_0F172A,
        fontFamily: "Poppins",letterSpacing: 0.2),),onTap: onTap,);
  }
}
