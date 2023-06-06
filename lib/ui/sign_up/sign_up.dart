import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/ui/sign_up/widgets/sign_up_with.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../home/home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.C_111015.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: AppColors.C_111015.withOpacity(0.9),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            color: AppColors.C_111015.withOpacity(0.85),
            width: double.infinity,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [Column(
                  children: [
                    SizedBox(
                      height: height * (80 / 812),
                    ),
                    const Text(
                      "BURGER BAR",
                      style: TextStyle(
                          fontSize: 52,
                          color: AppColors.white,
                          fontFamily: "AR CENA",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * (28 / 812),
                    ),
                    const Text(
                      "Войдите в свой профиль",
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Войдите, чтобы продолжить",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.C_6C7072,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * (48 / 812),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      width: double.infinity,
                      height: height * (60 / 812),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.C_22222A),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        cursorWidth: 1.5,
                        cursorHeight: 20,
                        cursorColor: AppColors.white,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-z@0-9.]'))
                        ],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.white,
                          fontFamily: "Poppins",
                        ),
                        decoration: InputDecoration(
                            icon: SvgPicture.asset(AppImages.telegram),
                            hintText: "Email or username",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.white,
                              fontFamily: "Poppins",
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.white))),
                      ),
                    ),
                    SizedBox(
                      height: height * (22 / 812),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      width: double.infinity,
                      height: height * (60 / 812),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.C_22222A),
                      child: TextField(
                        obscureText: passwordVisible,
                        keyboardType: TextInputType.emailAddress,
                        cursorWidth: 1.5,
                        cursorHeight: 20,
                        cursorColor: AppColors.white,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.white,
                          fontFamily: "Poppins",
                        ),
                        decoration: InputDecoration(
                            icon: SvgPicture.asset(AppImages.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Image.asset(
                                AppImages.eyeOff,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.white,
                              fontFamily: "Poppins",
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.C_22222A)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.white))),
                      ),
                    ),
                    SizedBox(
                      height: height * (34 / 812),
                    ),
                    const Text(
                      "Или продолжите с помощью  ",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * (46 / 812),
                    ),
                    Row(
                      children: [
                        const SignUpButtons(
                            text: "Facebook",
                            img: AppImages.facebook,
                            imgWidth: 30,
                            imgHeight: 30),
                        SizedBox(
                          width: width * (19 / 375),
                        ),
                        const SignUpButtons(
                            text: "Google",
                            img: AppImages.google,
                            imgWidth: 36,
                            imgHeight: 48),
                      ],
                    ),
                    SizedBox(
                      height: height * (44 / 812),
                    ),
                    Text(
                      "Забыли пароль?",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  AppColors.C_E1D24A,
                                  AppColors.C_C69233
                                ]).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
                    ),
                    SizedBox(
                      height: height * (32 / 812),
                    ),
                    Container(
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.C_E1D24A, AppColors.C_C69233])),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              "Войти",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                  fontFamily: "Poppins"),
                            ),
                          )),
                    )
                  ],
                )],
              ),
            ),
          )
        ],
      ),
    );
  }
}
