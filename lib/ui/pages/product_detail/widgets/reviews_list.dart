import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'review_item.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReviewItem(
          name: 'Catherine',
          review: 'I like it and iam 5-5 and the dress is the same length on me as the model but it is still really pretty. Its just like the picture. A definite must have.',
          time: '5 min ago',
        ),
        SizedBox(height: 20.h),
        const ReviewItem(
          name: 'Jasmine',
          review: 'Such a beautiful dress well made and fits perfectly I brought xs as Im four foot nine and six stone and this dress has to be one of my most favourite buys in a very long time its very well made and very elegant and looks so much more expensive. It is a nice color and it looks great on me',
          time: '5 min ago',
        ),
      ],
    );
  }
}