import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/local/home_card_model.dart';
import 'card_description.dart';
import 'card_image.dart';

class HomeCard extends StatelessWidget {
  final HomeCardModel item;
  final bool isEvenIndex;

  const HomeCard({super.key, required this.item, required this.isEvenIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isEvenIndex ? 30 : 0),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardImage(imagePath: item.imagePath),
            14.verticalSpace,
            CardDescription(
              title: item.title,
              amount: item.amount,
              onFavoritePressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
