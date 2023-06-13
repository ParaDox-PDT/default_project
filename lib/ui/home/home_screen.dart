import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/about_us/about_us_screen.dart';
import 'package:n8_default_project/ui/account/account.dart';
import 'package:n8_default_project/ui/login/login_page.dart';
import 'package:n8_default_project/ui/home/widgets/down_items.dart';
import 'package:n8_default_project/ui/home/widgets/list_items.dart';
import 'package:n8_default_project/ui/settings/settings.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * (24 / 375)),
          child: Column(
            children: [
              SizedBox(
                height: height * (20 / 812),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.logo),
                  SizedBox(
                    width: width * (8 / 375),
                  ),
                  const Text(
                    "Study",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.C_0F172A,
                        fontFamily: "Poppins",
                        letterSpacing: 0.2),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                thickness: 1,
                color: AppColors.C_F1F5F9,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.userSmall,
                    width: width * (58 / 375),
                  ),
                  SizedBox(
                    width: width * (12 / 375),
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Welcome\n",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.C_64748B,
                            fontFamily: "Poppins",
                            letterSpacing: 0.2),
                        children: [
                          TextSpan(
                            text: "Marvin McKinney",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.C_0F172A,
                                fontFamily: "Poppins",
                                letterSpacing: 0.2,
                                height: 1.5),
                          )
                        ]),
                  ),
                  const Spacer(),
                  Container(
                    width: width * (40 / 375),
                    height: height * (40 / 375),
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: AppColors.C_F1F5F9),
                    child: Center(
                      child: SvgPicture.asset(AppImages.logOut),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: AppColors.C_F1F5F9,
              ),
              SizedBox(height: height*(20/812),),
              Expanded(
                child: ListView(
                  children: [ListItems(
                      title: "Profile",
                      icon: AppImages.user,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                      }),
                    SizedBox(height: height*(24/812),),
                    ListItems(title: "Account", icon: AppImages.account, onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const AccountPage();
                          }));
                    }),
                    SizedBox(height: height*(24/812),),
                    ListItems(title: "Setting", icon: AppImages.settings, onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const SettingsPage();
                          }));
                    }),
                    SizedBox(height: height*(24/812),),
                    ListItems(title: "About", icon: AppImages.about, onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const AboutUsScreen();
                          }));
                    }),],
                ),
              ),

              SizedBox(height: height*(30/812),),
              Image.asset(AppImages.banner,height: height*(85/812),),
              SizedBox(height: height*(50/812),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DownItems(title: "Privacy Policy", img: AppImages.next),
                  DownItems(title: "Terms", img: AppImages.next),
                  DownItems(title: "English", img: AppImages.down),
                ],
              ),
              SizedBox(height: height*(40/812),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(AppImages.collection),
                  SvgPicture.asset(AppImages.calendar),
                  SvgPicture.asset(AppImages.message),
                  SvgPicture.asset(AppImages.navUser),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
