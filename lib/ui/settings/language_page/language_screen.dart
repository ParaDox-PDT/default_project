import 'package:easy_localization/easy_localization.dart';
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
   bool isRussian=false;
   bool isUzbek=false;
   bool isAmerica = false;


  @override
  void initState() {
    selectCountry("Russian");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  GlobalAppBar(title: tr("Choose_your_language")),
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
                  hintText: tr("Search"),
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
                         GetRow(
                            title: tr("Russian"), img: AppImages.russian),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("Russian");
                                context.setLocale(const Locale("ru", "RU"));
                              });

                            },
                            icon: isRussian
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
                         GetRow(
                            title: tr("Uzbek"), img: AppImages.uzbek),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                context.setLocale(const Locale("uz", "UZ"));
                                selectCountry("Uzbek");
                              });
                            },
                            icon: isUzbek
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
                         GetRow(title: tr("English"), img: AppImages.america),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectCountry("America");
                                context.setLocale(const Locale("en", "EN"));
                              });
                            },
                            icon: isAmerica
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
    isRussian=false;
    isAmerica = false;
    isUzbek=false;
    switch(country){
      case "Russian":{
        isRussian=true;
      }
      break;
      case "America":{
        isAmerica=true;
      }
      break;
      case "Uzbek":{
        isUzbek=true;
      }
      break;
    }
  }
}
