import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/models/login_model.dart';
import 'package:n8_default_project/ui/global_widgets/global_text_field.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/login/widgets/conteiner.dart';
import 'package:n8_default_project/ui/sign_up/sign_up_screen.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginModel loginModel;
  bool isOn = true;

  Future<void> saveLogin(String key, String value) async {
    await StorageRepository.putString(key, value);
  }

  Future<void> saveIsLogin(String key,bool value)async{
    await StorageRepository.putBool(key, value);
  }

  @override
  void initState() {
    loginModel = LoginModel(
        password: StorageRepository.getString("login_password"),
        email: StorageRepository.getString("login_email"));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.C_1317DD.withOpacity(0.69),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * (34 / 307.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.background, width: width * (226 / 307.5)),
                SizedBox(
                  height: height * (30 / 666),
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: AppColors.white,
                      fontFamily: "SF PRO"),
                ),
                SizedBox(
                  height: height * (16 / 666),
                ),
                Expanded(child: ListView(
                  children: [
                    GlobalTextField(
                        onChanged: (value) {
                          loginModel = loginModel.copyWith(email: value);
                        },
                        title: "Email",
                        img: AppImages.email,
                        inputType: TextInputType.emailAddress),
                    SizedBox(
                      height: height * (8 / 666),
                    ),
                    GlobalTextField(
                      onChanged: (value) {
                        loginModel = loginModel.copyWith(password: value);
                      },
                      title: "Password",
                      img: AppImages.lock,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: height * (12 / 666),
                    ),
                  ],
                )),
                Row(
                  children: [
                    Switch(
                      value: isOn,
                      onChanged: (value) =>
                          setState(() {
                            isOn = !isOn;
                          }),
                    ),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                          fontFamily: "SF PRO",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    ),
                    const Spacer(),
                    Text("Forgot Password?",
                        style: TextStyle(
                            fontFamily: "SF PRO",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withOpacity(0.8)))
                  ],
                ),
                SizedBox(
                  height: height * (18 / 666),
                ),
                SizedBox(
                  width: width * (204 / 307.5),
                  height: height * (40 / 666),
                  child: ElevatedButton(
                      onPressed: () {
                        saveLogin("login_password", loginModel.password);
                        saveLogin("login_email", loginModel.email);

                        if (StorageRepository.getString("login_password").toString() ==
                            StorageRepository.getString("password").toString() &&
                            StorageRepository.getString("email").toString() ==
                                StorageRepository.getString("login_email").toString()){
                          saveIsLogin("is_login",true);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return const HomeScreen();
                          }));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Login xato!")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.black,
                            fontFamily: "SF PRO"),
                      )),
                ),
                SizedBox(
                  height: height * (18 / 666),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      fontFamily: "SF PRO",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.8)),
                ),
                SizedBox(
                  height: height * (6 / 666),
                ),
                const Text(
                  "Log in with",
                  style: TextStyle(
                      fontFamily: "SF PRO",
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
                SizedBox(
                  height: height * (18 / 666),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LoginWith(img: AppImages.google),
                    LoginWith(img: AppImages.apple),
                    LoginWith(img: AppImages.facebook),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.white.withOpacity(0.8),
                          fontFamily: "SF PRO"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const SignUpScreen();
                              }));
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.white,
                              fontFamily: "SF PRO"),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
