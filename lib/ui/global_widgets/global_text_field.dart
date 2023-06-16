import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class GlobalTextField extends StatefulWidget {
  const GlobalTextField({
    super.key,
    required this.title,
    required this.img,
    this.isPassword = false,
    required this.inputType, required this.onChanged,
  });

  final String title;
  final String img;
  final bool isPassword;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;

  // final ValueChanged<String> onChanged;

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  final TextEditingController controller = TextEditingController();
  bool isVisible = true;

  @override
  void initState() {
    controller.addListener(() {});
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(0, 2),
                color: Colors.black.withOpacity(0.3))
          ]),
      child: TextField(
        controller: controller,
        onChanged: widget.onChanged,
        cursorColor: AppColors.black,
        cursorHeight: 15,
        keyboardType: widget.inputType,
        obscureText: widget.isPassword ? isVisible : false,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            fontSize: 14,
            fontFamily: "SF PRO"),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off))
              : const SizedBox(),
          hintText: widget.title,
          hintStyle: TextStyle(
            fontFamily: "SF PRO",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.7),
          ),
          icon: SvgPicture.asset(widget.img),
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
