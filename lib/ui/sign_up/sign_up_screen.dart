import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/global_widgets/global_text_field.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * (34 / 307.5)),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.background,
                  width: width * (226 / 307.5),
                ),
                SizedBox(
                  height: height * (30 / 666),
                ),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: AppColors.black,
                      fontFamily: "SF PRO"),
                ),
                SizedBox(
                  height: height * (16 / 666),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      GlobalTextField(
                          title: "First Name",
                          img: AppImages.person,
                          inputType: TextInputType.text),
                      SizedBox(
                        height: height * (8 / 666),
                      ),
                      GlobalTextField(
                          title: "Last Name",
                          img: AppImages.person,
                          inputType: TextInputType.text),
                      SizedBox(
                        height: height * (8 / 666),
                      ),
                      GlobalTextField(
                          title: "Email",
                          img: AppImages.email,
                          inputType: TextInputType.emailAddress),
                      SizedBox(
                        height: height * (8 / 666),
                      ),
                      GlobalTextField(
                        title: "Password",
                        img: AppImages.lock,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: height * (8 / 666),
                      ),
                      GlobalTextField(
                        title: "Confirm Password",
                        img: AppImages.lock,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * (204 / 307.5),
                  height: height * (50 / 666),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.white,
                          fontFamily: "SF PRO"),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.C_1317DD,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*(14/666),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.C_131212.withOpacity(0.8),
                        fontFamily: "SF PRO"),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));
                      },
                      child: Text(" Login",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.C_1317DD,
                          fontFamily: "SF PRO"),),
                    )
                  ],
                ),
                SizedBox(height: height*(8/666),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
