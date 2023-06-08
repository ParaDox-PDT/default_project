import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/widgets/reys.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.C_6760D4,
          Color(0xFFFF68C2),
          Color(0xFFFFDE73),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.back),
                    const Text(
                      "SEARCH RESULT",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          letterSpacing: 1,
                          fontFamily: "Quicksand"),
                    ),
                    SvgPicture.asset(AppImages.settings),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * (60 / 812),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * (10 / 375),
                          ),
                          const Text(
                            "22 AUG\n\$1070",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.C_6760D4,
                                letterSpacing: 1,
                                fontFamily: "Quicksand"),
                          ),
                          const Text(
                            "23 AUG\n\$1114",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.C_797979,
                                letterSpacing: 1,
                                fontFamily: "Quicksand"),
                          ),
                          const Text(
                            "24 AUG\n\$1114",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.C_797979,
                                letterSpacing: 1,
                                fontFamily: "Quicksand"),
                          ),
                          const Text(
                            "25 AUG\n\$1122",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.C_797979,
                                letterSpacing: 1,
                                fontFamily: "Quicksand"),
                          ),
                          Container(
                            width: width * (54 / 375),
                            height: height * (60 / 812),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6)),
                                color: AppColors.C_FC9A7D),
                            child: Center(
                              child: SvgPicture.asset(AppImages.calendar),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * (6 / 812),
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: width,
                                height: height * (645 / 812),
                                child: ListView(
                                  children: const [
                                    Reys(
                                        airways: "Turkish Airlines",
                                        clock: "09:45",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "19:00",
                                        days: "+1 Days",
                                        price: "\$1070",
                                        img: AppImages.turk),
                                    Reys(
                                        airways: "Ethiopian Airlines",
                                        clock: "11:00",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "20:00",
                                        days: "+1 Days",
                                        price: "\$1140",
                                        img: AppImages.eziopiya),
                                    Reys(
                                        airways: "Etihad Airways",
                                        clock: "09:45",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "19:00",
                                        days: "+1 Days",
                                        price: "\$1210",
                                        img: AppImages.etihad),
                                    Reys(
                                        airways: "Emirates",
                                        clock: "11:20",
                                        airTime: "12hrs 30mins",
                                        stops: "Non Stop",
                                        clock2: "07:20",
                                        days: "1",
                                        price: "\$1430",
                                        img: AppImages.emirates),
                                    Reys(
                                        airways: "Turkish Airlines",
                                        clock: "09:45",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "19:00",
                                        days: "+1 Days",
                                        price: "\$1070",
                                        img: AppImages.turk),
                                    Reys(
                                        airways: "Ethiopian Airlines",
                                        clock: "11:00",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "20:00",
                                        days: "+1 Days",
                                        price: "\$1140",
                                        img: AppImages.eziopiya),
                                    Reys(
                                        airways: "Etihad Airways",
                                        clock: "09:45",
                                        airTime: "17hrs 15mins",
                                        stops: "1 Stop",
                                        clock2: "19:00",
                                        days: "+1 Days",
                                        price: "\$1210",
                                        img: AppImages.etihad),
                                    Reys(
                                        airways: "Emirates",
                                        clock: "11:20",
                                        airTime: "12hrs 30mins",
                                        stops: "Non Stop",
                                        clock2: "07:20",
                                        days: "1",
                                        price: "\$1430",
                                        img: AppImages.emirates),
                                  ],
                                )),
                            Positioned(
                              right: 100,
                              bottom: 10,
                              child: Container(
                                width: width * (152 / 375),
                                height: height * (40 / 812),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      AppColors.C_6760D4,
                                      AppColors.C_A435FC
                                    ]),
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: AppColors.C_6760D4,
                                          spreadRadius: 4,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Ink(
                                  child: InkWell(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AppImages.filter),
                                        SizedBox(
                                          width: width * (4 / 375),
                                        ),
                                        const Text(
                                          "Filter",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Quicksand",
                                              color: AppColors.white),
                                        )
                                      ],
                                    ),
                                    onTap: () {},
                                    onDoubleTap: () {},
                                    onLongPress: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
