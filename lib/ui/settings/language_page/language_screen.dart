import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/settings/language_page/widgets/get_row.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../../utils/colors.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
   bool isIndonesia = false;
   bool isPhilippines = false;
   bool isItaly = false;
   bool isIreland = false;
   bool isGerman = false;
   bool isMalaysia= false;
   bool isAmerica = false;
   bool isBelgia = false;
   bool isNewZeland = false;

  @override
  void initState() {
    selectCountry("Indonesia");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const GlobalAppBar(title: "Choose your language"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * (20 / 375)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.C_F3F5F8),
              child: TextField(
                cursorHeight: 20,
                cursorWidth: 1.4,
                cursorColor: Colors.black.withOpacity(0.2),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: SvgPicture.asset(AppImages.find),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: width * (8 / 375),
                      vertical: height * (15 / 812)),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.C_64748B,
                      fontFamily: "Poppins",
                      letterSpacing: 0.2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_F3F5F8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.C_F3F5F8,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.C_F3F5F8,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.C_F3F5F8,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * (20 / 812),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(
                            title: "Indonesia", img: AppImages.indonesia),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Indonesia");
                              });

                            },
                            icon: isIndonesia
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(
                            title: "Philippines", img: AppImages.philippines),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Philippines");
                              });
                            },
                            icon: isPhilippines
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(title: "Italy", img: AppImages.italy),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Italy");
                              });
                            },
                            icon: isItaly
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(title: "Ireland", img: AppImages.ireland),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Ireland");
                              });
                            },
                            icon: isIreland
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(title: "German", img: AppImages.germany),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("German");
                              });
                            },
                            icon: isGerman
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(
                            title: "Malaysia", img: AppImages.malaysia),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Malaysia");
                              });
                            },
                            icon: isMalaysia
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(title: "America", img: AppImages.america),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("America");
                              });
                            },
                            icon: isAmerica
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(title: "Belgia", img: AppImages.belgia),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Belgia");
                              });
                            },
                            icon: isBelgia
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * (12 / 812)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetRow(
                            title: "New Zeland", img: AppImages.newZeland),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("NewZeland");
                              });
                            },
                            icon: isNewZeland
                                ? SvgPicture.asset(AppImages.done)
                                : SvgPicture.asset(AppImages.empty)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectCountry([String? country]){
    isIndonesia = false;
    isPhilippines = false;
    isItaly = false;
    isIreland = false;
    isGerman = false;
    isMalaysia= false;
    isAmerica = false;
    isBelgia = false;
    isNewZeland = false;
    switch(country){
      case "Indonesia":{
        isIndonesia=true;
      }
      break;
      case "Philippines":{
        isPhilippines=true;
      }
      break;
      case "Italy":{
        isItaly=true;
      }
      break;
      case "Ireland":{
        isIreland=true;
      }
      break;
      case "German":{
        isGerman=true;
      }
      break;
      case "Malaysia":{
        isMalaysia=true;
      }
      break;
      case "America":{
        isAmerica=true;
      }
      break;
      case "Belgia":{
        isBelgia=true;
      }
      break;
      case "NewZeland":{
        isNewZeland=true;
      }
      break;
    }
  }
}
