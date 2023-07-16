import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/presentation/core/colors.dart';
import 'package:flutter_bloc_tutorial/presentation/home/widgets/build_app_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                elevation: 0,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  context.read<HomeBloc>().add(TriggerAppEvent(value));
                },
                items: bottomTabs,
              ),
            ),
          ),
        );
      },
    );
  }
}
