import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'review_item.dart';

class ReviewsList extends StatelessWidget {
  final List<dynamic> reviews;
  final int reviewCount;

  const ReviewsList({
    super.key,
    required this.reviews,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return Center(
        child: Text(
          'No reviews yet',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Column(
      children: [
        ...reviews.map((review) => Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: ReviewItem(
            name: review['user'] ?? 'Anonymous',
            review: review['comment'] ?? '',
            time: review['created_at'] ?? '',
            rating: review['rating'] ?? 0,
          ),
        )),
      ],
    );
  }
}