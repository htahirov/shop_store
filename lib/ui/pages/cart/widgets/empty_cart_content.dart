import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/helpers/go.dart';
import '../../../../utils/helpers/pager.dart';

class EmptyCartContent extends StatelessWidget {
  const EmptyCartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center( 
              child: Text(
                'Cart',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 26.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  letterSpacing: -0.13,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://d1766v6rpl2wri.cloudfront.net/e98one%2Fpreview%2F64509272%2Fmain_large.png?response-content-disposition=inline%3Bfilename%3D%22main_large.png%22%3B&response-content-type=image%2Fpng&Expires=1739547457&Signature=H12eWNRrWFbxrkOA4hD5YUXWGcpHE4a0DI2O-AqEAg13czqY~HFpfWq10mGjb5U6LkJtZ4EoBK3RrK9NPfD9BIorhS9vlIfQAeFfKHnWVvKgVmsxXmcEYCpLhJg5vIa86n6NWPFVyMQP2zQetSD5AqX3k5PCCmnODhb1MtyoR-L3wVJvOE3JxkhImkRRDhNtHfjDa5hRmzajADFBuvDCGMLAtAuFI-cXKin6~eXB7juwAwgde4i5MsPenL45iURzubibjxu7yDI6VmAHebNJFzWaQx3af97P2QmaMzJt0xdVtNFXGCIl8EQUxZcdWV3Xqft1XOprb-oJk6V5TXnktQ__&Key-Pair-Id=APKAJT5WQLLEOADKLHBQ',
                    width: 173.w,
                    height: 224.h,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: 173.w,
                        height: 224.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      width: 173.w,
                      height: 224.h,
                      child: const Icon(Icons.error_outline),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Empty Basket',
                    style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamilyNunito,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.07,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Your basket is still empty, browse the attractive promos from bardeal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkGray,
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamilyNunito,
                      fontWeight: FontWeight.w400,
                      height: 1.57,
                      letterSpacing: -0.07,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: GestureDetector(
                onTap: () => Go.to(context, Pager.home),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 7.h,
                    ),
                    child: Center(
                      child: Text(
                        'Shopping Now',
                        style: TextStyle(
                          color: AppColors.titleTextColor,
                          fontSize: 14.sp,
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.07,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}