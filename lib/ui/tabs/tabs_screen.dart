import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/ui/router.dart';
import 'package:n8_default_project/ui/tabs/calendar/calendar_screen.dart';
import 'package:n8_default_project/ui/tabs/focus/focus_screen.dart';
import 'package:n8_default_project/ui/tabs/home/home_screen.dart';
import 'package:n8_default_project/ui/tabs/profile/profile_screen.dart';
import 'package:n8_default_project/utils/colors.dart';
import 'package:n8_default_project/utils/icons.dart';

import '../../models/todo_category.dart';
import '../../models/todo_model.dart';
import '../../models/todo_status.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  List<Widget> _screens = [];

  List<ToDoModel> toDos = [
    ToDoModel(
      expiredDate: "2023-08-23 19:30",
      description: "Desc",
      title: "Fitnesga borishim kk",
      createdAt: "",
      category: ToDoCategory(
        id: 1,
        categoryName: "Sport",
        iconPath: AppImages.sport,
        colorInString: "FF8080",
      ),
      status: ToDoStatus.inProgress,
    ),
  ];

  @override
  void initState() {
    _screens = [
      HomeScreen(
        toDos: toDos,
      ),
      CalendarScreen(),
      FocusScreen(),
      ProfileScreen(),
    ];

    super.initState();
  }

  _updateHomeScreen() {
    _screens[0] = HomeScreen(toDos: toDos);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        _screens[currentIndex],
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: const BoxDecoration(color: AppColors.C_363636),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getMyBarItem(
                    isActive: currentIndex == 0,
                    icon: AppImages.homePassive,
                    activeIcon: AppImages.home,
                    label: "Home",
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    }),
                _getMyBarItem(
                    isActive: currentIndex == 1,
                    icon: AppImages.calendarPassive,
                    activeIcon: AppImages.calendar,
                    label: "Calendar",
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    }),
                const SizedBox(width: 36),
                _getMyBarItem(
                    isActive: currentIndex == 2,
                    icon: AppImages.focusPassive,
                    activeIcon: AppImages.focus,
                    label: "Focus",
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    }),
                _getMyBarItem(
                    isActive: currentIndex == 3,
                    icon: AppImages.profile,
                    activeIcon: AppImages.profile,
                    label: "Profile",
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    }),
              ],
            ),
          ),
        ),
        Positioned(
            left: (width - 64) / 2,
            right: (width - 64) / 2,
            bottom: 70,
            child: SizedBox(
              width: 64,
              height: 64,
              child: FloatingActionButton(
                backgroundColor: AppColors.C_8687E7,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.addToDoScreen,
                    arguments: (toDo) {
                      setState(() {
                        toDos.add(toDo);
                        _updateHomeScreen();
                      });
                    },
                  );
                },
                child: SvgPicture.asset(
                  AppImages.add,
                ),
              ),
            ))
      ],
    ));
  }

  _getMyBarItem({
    required String icon,
    required String activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Column(children: [
      IconButton(
        onPressed: onTap,
        icon: isActive ? SvgPicture.asset(activeIcon) : SvgPicture.asset(icon),
      ),
      // SizedBox(height: 8.h),
      Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      )
    ]);
  }
}
//
