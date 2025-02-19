import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';

class QuantityControls extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onDelete;

  const QuantityControls({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _QuantityButton(
          icon: Icons.remove,
          onTap: onDecrease,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            quantity.toString(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _QuantityButton(
          icon: Icons.add,
          onTap: onIncrease,
          color: AppColors.coldLips,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: onDelete,
          icon: Icon(
            Icons.delete_outline,
            color: AppColors.redmana,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.white,
          border: color == null ? Border.all(
            color: AppColors.platinum,
            width: 1.5,
          ) : null,
        ),
        child: Icon(
          icon,
          size: 16.r,
          color: color == null ? AppColors.textButtonColor : Colors.white,
        ),
      ),
    );
  }
}