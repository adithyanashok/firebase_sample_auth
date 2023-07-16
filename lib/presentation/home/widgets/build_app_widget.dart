import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widgets = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Search Screen")),
    const Center(child: Text("Course Screen")),
    const Center(child: Text("Chat Screen")),
    const Center(child: Text("Profile Screen")),
  ];
  return _widgets[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset('assets/icons/home.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        'assets/icons/home.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset('assets/icons/search.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        'assets/icons/search.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        'assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: "Course",
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset('assets/icons/message.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        'assets/icons/message.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: "Chat",
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset('assets/icons/person.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        'assets/icons/person.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: "Profile",
  ),
];
