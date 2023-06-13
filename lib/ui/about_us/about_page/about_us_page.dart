import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/utils/colors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const GlobalAppBar(title: ""),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About Us?",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.C_0F172A,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
            SizedBox(
              height: height * (24 / 812),
            ),
            const Text(
              "Study is a  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut    sagittis libero augue interdum. ",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_334155,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
            SizedBox(
              height: height * (24 / 812),
            ),
            const Divider(
              thickness: 0.3,
            ),
            SizedBox(
              height: height * (24 / 812),
            ),
            const Text(
              "Lorem Ipsum",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.C_0F172A,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
            SizedBox(
              height: height * (18 / 812),
            ),
            const Text(
              "Lorem ipsum sdolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum. ",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_334155,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
            SizedBox(
              height: height * (18 / 812),
            ),
            const Text(
              "Lorem ipsum sdolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum. ",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_334155,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
            SizedBox(
              height: height * (18 / 812),
            ),
            const Text(
              "Lorem ipsum sdolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum. ",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_334155,
                  fontFamily: "Poppins",
                  letterSpacing: 0.2),
            ),
          ],
        ),
      ),
    );
  }
}
