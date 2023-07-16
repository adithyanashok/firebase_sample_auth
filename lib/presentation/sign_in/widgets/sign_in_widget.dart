import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/presentation/core/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar({required String AppBarTitle}) {
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    backgroundColor: Colors.white,
    title: Center(
      child: Text(
        AppBarTitle,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}

// Third party auth
Widget thirdPartyAuth(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    padding: EdgeInsets.only(left: 85.w, right: 85.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reUsableIconsWidget(iconName: "google"),
        reUsableIconsWidget(iconName: "apple"),
        reUsableIconsWidget(iconName: "facebook"),
      ],
    ),
  );
}

// Reusable Icon widget
Widget reUsableIconsWidget({required String iconName}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reUsableTextWidget({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(1),
        fontWeight: FontWeight.normal,
        fontSize: 13.sp,
      ),
    ),
  );
}

Widget buildTextField(
    {required String hintText,
    required String type,
    required iconName,
    void Function(String value)? func}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15.w),
      ),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        // <-----------Icon container-------------> //
        Container(
          width: 20.w,
          height: 20.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        //<----------Text Field Container------------>
        Container(
          width: 270.w,
          height: 50.h,
          //<---------Text Field---------------->
          child: TextField(
            onChanged: (value) {
              func!(value);
            },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              //<------------borders------------------>
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            autocorrect: false,
            obscureText: type == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildLoginAndSignupButton(
    {required String buttonName,
    required String buttonType,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        top: buttonType == "login" ? 80.h : 10.h,
      ),
      decoration: BoxDecoration(
        color: buttonType == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType == "login"
              ? Colors.transparent
              : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
  );
}
