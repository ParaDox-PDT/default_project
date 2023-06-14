import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/global_widgets/global_button.dart';
import 'package:n8_default_project/ui/global_widgets/text_field.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isMale = false;
  bool isFemale = false;
  Color maleColor = AppColors.C_F1F5F9;
  Color femaleColor = AppColors.white;

  @override
  void initState() {
    isMale = false;
    isFemale = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:  GlobalAppBar(title: tr("Profile")),
      body: Column(
        children: [
          SizedBox(
            height: height * (30 / 812),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    AppImages.userMedium,
                    width: width * (80 / 375),
                    height: height * (80 / 812),
                  ),
                  Container(
                    width: width * (32 / 375),
                    height: height * (32 / 812),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3.5, color: AppColors.white)),
                    child: Center(
                      child: Container(
                        width: width * (32 / 375),
                        height: height * (32 / 812),
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(), color: AppColors.C_4178D4),
                        child: Center(
                          child: SvgPicture.asset(AppImages.camera),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * (40 / 812),
          ),
          Expanded(
            child: SizedBox(
              width: width,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * (24 / 375)),
                    child: Column(
                      children: [
                         GetTextField(
                            title: tr("Name"),
                            text: tr("User_name"),
                            type: TextInputType.name),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                         GetTextField(
                            title: tr("Email"),
                            text: tr("Email_address"),
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                        GetTextField(
                            title: tr("Date_of_birth"),
                            text: tr("Date_of_birth"),
                            type: TextInputType.datetime),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                         GetTextField(
                            title: tr("Phone_Number"),
                            text: tr("Phone_Number"),
                            type: TextInputType.phone),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              tr("Student_ID"),
                              style: const TextStyle(
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColors.C_CBD5E1.withOpacity(0.4)),
                              child: TextField(
                                cursorHeight: 20,
                                cursorWidth: 1.4,
                                cursorColor: Colors.black.withOpacity(0.2),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[#0-9]'))
                                ],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 15),
                                  border: InputBorder.none,
                                  hintText: tr("Student_ID"),
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.C_64748B,
                                      fontFamily: "Poppins",
                                      letterSpacing: 0.2),
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
                        ),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              tr("Gender"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: AppColors.C_0F172A,
                                  fontFamily: "Poppins",
                                  letterSpacing: 0.2),
                            ),
                            SizedBox(
                              height: height * (8 / 812),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: width * (156 / 375),
                                    height: height * (48 / 812),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: maleColor,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.C_CBD5E1)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isMale = true;
                                              isFemale = false;
                                              maleColor = AppColors.C_F1F5F9;
                                              femaleColor = AppColors.white;
                                            });
                                          },
                                          icon: SvgPicture.asset(isMale
                                              ? AppImages.done
                                              : AppImages.empty),
                                        ),
                                        SizedBox(
                                          width: width * (10 / 375),
                                        ),
                                         Text(
                                          tr("Male"),
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.C_0F172A),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * (14 / 375),
                                ),
                                Expanded(
                                  child: Container(
                                    width: width * (156 / 375),
                                    height: height * (48 / 812),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: femaleColor,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.C_CBD5E1)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isFemale = true;
                                              isMale = false;
                                              femaleColor = AppColors.C_F1F5F9;
                                              maleColor = AppColors.white;
                                            });
                                          },
                                          icon: SvgPicture.asset(isFemale
                                              ? AppImages.done
                                              : AppImages.empty),
                                        ),
                                        SizedBox(
                                          width: width * (10 / 375),
                                        ),
                                         Text(
                                          tr("Female"),
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.C_0F172A),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * (16 / 812),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              tr("Address"),
                              style: const TextStyle(
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColors.C_F1F5F9.withOpacity(0.4)),
                              child: TextField(
                                cursorHeight: 20,
                                cursorWidth: 1.4,
                                cursorColor: Colors.black.withOpacity(0.2),
                                keyboardType: TextInputType.text,
                                maxLines: 4,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 15),
                                  border: InputBorder.none,
                                  hintText:
                                      tr("Address"),
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.C_0F172A,
                                      fontFamily: "Poppins",
                                      letterSpacing: 0.2),
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
                        ),
                        SizedBox(
                          height: height * (24 / 812),
                        ),
                         GlobalButton(title: tr("Update_Profile")),
                        SizedBox(height: height*(26/812),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}