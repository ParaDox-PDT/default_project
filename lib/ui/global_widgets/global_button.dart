import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.C_52B6DF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: Size(double.infinity, height*(56/812))
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: AppColors.white,
              fontFamily: "Poppins"),
        ),
      ),
    );
  }
}
