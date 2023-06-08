import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class Reys extends StatelessWidget {
  const Reys({Key? key, required this.airways, required this.clock, required this.airTime, required this.stops, required this.clock2, required this.days, required this.price, required this.img}) : super(key: key);
  final String airways;
  final String img;
  final String clock;
  final String airTime;
  final String stops;
  final String clock2;
  final String days;
  final String price;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: double.infinity,
        height: height * (120 / 812),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.white),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    img,
                    height: height * (18 / 812),
                  ),
                  Text(
                    airways,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: AppColors.C_333333,
                        fontFamily: "Quicksand"),
                  )
                ],
              ),
              SizedBox(height: height*(6/812),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "NYC\n",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: AppColors.C_555555,
                            fontFamily: "Quicksand"),
                        children: [
                          TextSpan(
                              text: clock,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  color: AppColors.C_333333,
                                  fontFamily: "Quicksand"))
                        ]),
                  ),
                  Column(
                    children: [
                      Text(
                        airTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: AppColors.C_7F7F7F,
                            fontFamily: "Quicksand"),
                      ),
                      SizedBox(height: height*(6/812),),
                      SvgPicture.asset(AppImages.airplan),
                      SizedBox(height: height*(6/812),),
                      Text(
                        stops,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: AppColors.C_7F7F7F,
                            fontFamily: "Quicksand"),
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("DXB",style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: AppColors.C_555555,
                          fontFamily: "Quicksand"),),
                      Text(clock2,style:const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 1,
                          color: AppColors.C_333333,
                          fontFamily: "Quicksand"),),
                      Text(days,style:const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          letterSpacing: 1,
                          color: AppColors.C_EB5757,
                          fontFamily: "Quicksand"),),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.info),
                      SizedBox(width: width*(6/375),),
                      const Text("FLIGHT INFO",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          letterSpacing: 1,
                          color: AppColors.C_A5A5A5,
                          fontFamily: "Quicksand"),)
                    ],
                  ),
                  Text(price,style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.C_6760D4,
                      fontFamily: "Quicksand"),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
