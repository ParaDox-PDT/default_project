import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/widgets/list.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.C_3A0CA3,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.C_3A0CA3,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: height * (50 / 812),
                    width: width * (50 / 375),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.C_F72585),
                    child: Center(
                      child: Image.asset(
                        AppImages.user,
                        width: width * (22 / 375),
                        height: height * (33 / 812),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * (6 / 375),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hoşgeldin",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withOpacity(0.6),
                            fontFamily: "Montserrat"),
                      ),
                      const Text(
                        "Doğukan Erel",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            fontFamily: "Montserrat"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width * (137 / 375),
                  ),
                  SvgPicture.asset(AppImages.settings),
                ],
              ),
              SizedBox(
                height: height * (35 / 812),
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    width: double.infinity,
                    height: height * (24 / 812),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "250",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    width: width * (253 / 375),
                    height: height * (24 / 812),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.C_F72585),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "200",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "İndirim kuponu için son 50 puan!",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        fontFamily: "Montserrat"),
                  )
                ],
              ),
              SizedBox(
                height: height * (46 / 812),
              ),
              Container(
                width: double.infinity,
                height: height * (60 / 812),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.C_46B658),
                child: const Center(
                  child: Text(
                    "Favorilerim",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontFamily: "Montserrat"),
                  ),
                ),
              ),
              SizedBox(
                height: height * (48 / 812),
              ),
              const TextList(
                  text1: "Sandy Ridge Camping Canton",
                  text2: "Sandy Ridge Camping Canton",
                  text3: "Sandy Ridge Camping Canton",
                  img: AppImages.redArrow,
                  title: "Son Siparişlerim"),
              SizedBox(
                height: height * (32 / 812),
              ),
              const TextList(
                  text1: "Ev Adresi, Muğla/Menteşe",
                  text2: "İş Adresi, Muğla/Menteşe",
                  text3: "Adres, Ankara/Yenimahalle",
                  img: AppImages.greenArrow,
                  title: "Adreslerim"),
              SizedBox(height: height*(46/812),),
              Container(
                padding: const EdgeInsets.only(top: 16),
                width: double.infinity,
                height: height*(72/812),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(AppImages.home),
                    SvgPicture.asset(AppImages.category),
                    SvgPicture.asset(AppImages.buy),
                    SvgPicture.asset(AppImages.profile,width: 40,height: 40,color: AppColors.white,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
