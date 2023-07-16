import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/welcome/welcome_bloc.dart';
import 'package:flutter_bloc_tutorial/global.dart';
import 'package:flutter_bloc_tutorial/main.dart';
import 'package:flutter_bloc_tutorial/presentation/core/colors.dart';
import 'package:flutter_bloc_tutorial/presentation/core/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_in/sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //<----------------Bloc Builder-------------------->//
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      print(index);
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(WelcomePageEvent());
                    },
                    children: [
                      _pages(
                        1,
                        context,
                        "assets/images/reading.png",
                        "First See Learning",
                        "Forget about a for of paper all knowledge in one learning!",
                        "Next",
                      ),
                      _pages(
                        2,
                        context,
                        "assets/images/boy.png",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & \n friend. Let's get connected!",
                        "Next",
                      ),
                      _pages(
                        3,
                        context,
                        "assets/images/man.png",
                        "Always Fascinated Learning",
                        "Anywhere, anytime, The time is at your discretion so study whenever you want.",
                        "Get Started",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.w,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(15.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _pages(
    int index,
    BuildContext context,
    String imageUrl,
    String title,
    String subtitle,
    String buttonName,
  ) {
    return Column(
      children: [
        //<------------ Image Url ---------------->//
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        //<-------------- Title ------------------>//
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        //<--------------- Subtitle------------------->//
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Center(
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primarySecondaryElementText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        //<-------------------button-------------------->//
        //<-------------------Gesture Detector-------------------->//
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("The value is ${Global.storageService.getDeviceOpen()}");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signin", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15.w,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
