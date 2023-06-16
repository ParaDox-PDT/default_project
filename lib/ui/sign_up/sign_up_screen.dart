import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/models/sign_up_model.dart';
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
  late SignUpModel signUpModel;

  @override
  void initState() {
    signUpModel = SignUpModel(
        confirmPassword: StorageRepository.getString("confirm_password"),
        firstName: StorageRepository.getString("first_name"),
        lastName: StorageRepository.getString("last_name"),
        email: StorageRepository.getString("email"),
        password: "password");
    super.initState();
  }

  Future<void> saveInputText(String key, String value) async {
    await StorageRepository.putString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          children: [Padding(
            padding: EdgeInsets.symmetric(horizontal: width * (34 / 307.5)),
            child: SizedBox(
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
                  const Text(
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
                  GlobalTextField(
                      onChanged: (value) {
                        signUpModel =
                            signUpModel.copyWith(firstName: value);
                      },
                      title: "First Name",
                      img: AppImages.person,
                      inputType: TextInputType.text),
                  SizedBox(
                    height: height * (8 / 666),
                  ),
                  GlobalTextField(
                      onChanged: (value) {
                        signUpModel = signUpModel.copyWith(lastName: value);
                      },
                      title: "Last Name",
                      img: AppImages.person,
                      inputType: TextInputType.text),
                  SizedBox(
                    height: height * (8 / 666),
                  ),
                  GlobalTextField(
                      onChanged: (value) {
                        signUpModel = signUpModel.copyWith(email: value);
                      },
                      title: "Email",
                      img: AppImages.email,
                      inputType: TextInputType.emailAddress),
                  SizedBox(
                    height: height * (8 / 666),
                  ),
                  GlobalTextField(
                    onChanged: (value) {
                      signUpModel = signUpModel.copyWith(password: value);
                    },
                    title: "Password",
                    img: AppImages.lock,
                    inputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: height * (8 / 666),
                  ),
                  GlobalTextField(
                    onChanged: (value) {
                      signUpModel =
                          signUpModel.copyWith(confirmPassword: value);
                    },
                    title: "Confirm Password",
                    img: AppImages.lock,
                    inputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: width * (204 / 307.5),
                    height: height * (50 / 666),
                    child: ElevatedButton(
                      onPressed: () {
                        if (signUpModel.canSaveData()) {
                          saveInputText("first_name", signUpModel.firstName);
                          saveInputText("last_name", signUpModel.lastName);
                          saveInputText("email", signUpModel.email);
                          saveInputText("password", signUpModel.password);
                          saveInputText(
                              "confirm_password", signUpModel.confirmPassword);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Ma'lumotlar xato kiritildi!")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.C_1317DD,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: "SF PRO"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * (14 / 666),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.C_131212.withOpacity(0.8),
                            fontFamily: "SF PRO"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.C_1317DD,
                              fontFamily: "SF PRO"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * (8 / 666),
                  ),
                ],
              ),
            ),
          )],
        ),
      ),
    );
  }
}
