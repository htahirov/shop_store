import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressLoading extends StatelessWidget {
  final double size;

  CustomProgressLoading.small({super.key}) : size = 24.0.sp;
  CustomProgressLoading.medium({super.key}) : size = 48.0.sp;
  CustomProgressLoading.large({super.key}) : size = 72.0.sp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(),
    );
  }
}
