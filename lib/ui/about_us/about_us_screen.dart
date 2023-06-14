import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/about_us/about_page/about_us_page.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/global_widgets/list_items.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  GlobalAppBar(title: tr("About_Us")),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          children: [
            GlobalListItems(
                title: tr("About_Us"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AboutUsPage();
                  }));
                }),
            const Divider(
              thickness: 0.5,
            ),
            GlobalListItems(title: tr("Help"), onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            GlobalListItems(title: tr("Term_and_Condition"), onTap: () {}),
            const Divider(
              thickness: 0.5,
            ),
            GlobalListItems(title: tr("Data_Protection"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}