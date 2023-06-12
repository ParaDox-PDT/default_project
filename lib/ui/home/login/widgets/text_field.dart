import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class GetTextField extends StatelessWidget {
  const GetTextField({super.key, required this.title, required this.text, required this.type});
  final String title;
  final String text;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColors.C_0F172A,
              fontFamily: "Poppins",
              letterSpacing: 0.2),
        ),
        SizedBox(
          height: height * (8 / 812),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: AppColors.C_F1F5F9.withOpacity(0.4)),
          child: TextField(
            cursorHeight: 20,
            cursorWidth: 1.4,
            cursorColor:Colors.black.withOpacity(0.2),
            keyboardType: type,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 15),
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_0F172A,
                  fontFamily: "Poppins",letterSpacing: 0.2),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.C_CBD5E1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.C_CBD5E1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.C_CBD5E1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.C_CBD5E1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
