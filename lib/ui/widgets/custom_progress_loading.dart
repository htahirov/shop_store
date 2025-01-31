import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressLoading extends StatelessWidget {
  const CustomProgressLoading({
    super.key,
    required this.size,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  });

  const CustomProgressLoading.small({
    super.key,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : size = 24.0;

  const CustomProgressLoading.medium({
    super.key,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : size = 48.0;

  const CustomProgressLoading.large({
    super.key,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : size = 72.0;

  final double size;
  final AlignmentGeometry alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: SizedBox(
          width: size.r,
          height: size.r,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
