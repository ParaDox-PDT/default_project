import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize{
  const GlobalAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(AppImages.backArrow),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.black,
            fontFamily: "Poppins"),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
