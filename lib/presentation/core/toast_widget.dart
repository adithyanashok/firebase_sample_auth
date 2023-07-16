import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

snackBar({
  required BuildContext context,
  required String msg,
}) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      ),
    ),
    elevation: 2,
    backgroundColor: Colors.black,
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
