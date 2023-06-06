import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/ui/home/widgets/list_view_item.dart';
import 'package:n8_default_project/ui/sign_up/sign_up.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int price1 = 160;
  int price2 = 100;
  int price3 = 120;
  int sum = 0;

  @override
  void initState() {
    sum = (count1 * price1) + (count2 * price2) + (count3 * price3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.C_111015,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: height * (40 / 812),
                  ),
                  Row(
                    children: [
                      Ink(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.C_E1D24A,
                                  AppColors.C_C69233
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const SignUpPage();
                                },
                              ),
                            );
                          },
                          child: Center(
                            child: SvgPicture.asset(AppImages.backArrow),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * (60 / 375),
                      ),
                      const Text(
                        "Детали заказа",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * (44 / 812),
                  ),
                  SizedBox(
                    width: width * (344 / 375),
                    height: height * (360 / 812),
                    child: ListView(
                      children: [
                        ListViewItem(
                          img: AppImages.burger,
                          title: "Чикен Бургер",
                          subtitle: "Изящный бургер",
                          price: 160,
                          count: count1,
                          onTapMinus: () => setState(() {
                            count1 != 0 ? count1-- : count1 = 0;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                          onTapPlus: () => setState(() {
                            count1++;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                        ),
                        SizedBox(
                          height: height * (22 / 812),
                        ),
                        ListViewItem(
                          img: AppImages.free,
                          title: "Картошка Фри",
                          subtitle: "Хрустят отлично",
                          price: 100,
                          count: count2,
                          onTapMinus: () => setState(() {
                            count2 != 0 ? count2-- : count2 = 0;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                          onTapPlus: () => setState(() {
                            count2++;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                        ),
                        SizedBox(
                          height: height * (22 / 812),
                        ),
                        ListViewItem(
                          img: AppImages.cockteyl,
                          title: "Молочный коктейль",
                          subtitle: "Отлично подойдет",
                          price: 120,
                          count: count3,
                          onTapMinus: () => setState(() {
                            count3 != 0 ? count3-- : count3 = 0;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                          onTapPlus: () => setState(() {
                            count3++;
                            sum = (count1 * price1) +
                                (count2 * price2) +
                                (count3 * price3);
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
              width: double.infinity,
              height: height * (220 / 812),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: AppColors.C_18171C),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Стоимость всех товаров",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "₽${sum.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * (14 / 812),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Чаевые курьеру",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "₽30",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * (14 / 812),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Общая стоимость",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "₽${(sum + 30).toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.white,
                            fontFamily: "Inter"),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.C_E1D24A, AppColors.C_C69233])),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {},
                        child: const Center(
                          child: Text(
                            "Оплатить",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                fontFamily: "Poppins"),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.grey.withOpacity(0.4),
            ),
            Container(
              width: double.infinity,
              height: height * (70 / 812),
              color: AppColors.C_18171C,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(AppImages.home),
                  SvgPicture.asset(AppImages.bag),
                  Image.asset(
                    "assets/images/shop.png",
                    width: width * (40 / 375),
                    height: height * (40 / 812),
                  ),
                  SvgPicture.asset(AppImages.love),
                  SvgPicture.asset(AppImages.smile),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
