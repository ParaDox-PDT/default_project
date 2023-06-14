import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/utils/icons.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> foods = [
      AppImages.burger,
      AppImages.cake,
      AppImages.coctayl,
      AppImages.cola,
      AppImages.iceCream,
      AppImages.juice,
      AppImages.lavash,
      AppImages.pepsi,
      AppImages.pizza,
      AppImages.shourma,
      AppImages.burger,
      AppImages.cake,
      AppImages.coctayl,
      AppImages.cola,
      AppImages.iceCream,
      AppImages.juice,
      AppImages.lavash,
      AppImages.pepsi,
      AppImages.pizza,
      AppImages.shourma
    ];
    List<String> titles = [
      "Burger",
      "Cake",
      "Coctayl",
      "Cola",
      "Ice Cream",
      "Juice",
      "Lavash",
      "Pepsi",
      "Pizza",
      "Shourma",
      "Burger",
      "Cake",
      "Coctayl",
      "Cola",
      "Ice Cream",
      "Juice",
      "Lavash",
      "Pepsi",
      "Pizza",
      "Shourma"
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Find Your\nFavorite Food",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade900),
                      child: Center(
                          child: SvgPicture.asset("assets/svg/noti.svg")))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular Restorant",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .8),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade900),
                          margin: const EdgeInsets.all(5),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 140, child: Image.asset(foods[index],fit: BoxFit.cover,)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  titles[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
