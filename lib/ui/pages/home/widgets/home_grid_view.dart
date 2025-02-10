import 'package:flutter/material.dart';

import '../../../../data/models/local/home_card_model.dart';
import 'home_card.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 0.7,
      ),
      itemCount: HomeCardModel.sampleList.length,
      itemBuilder: (context, index) {
        final item = HomeCardModel.sampleList[index];
        final isEvenIndex = index % 2 == 0;
        return HomeCard(
          item: item,
          isEvenIndex: isEvenIndex,
        );
      },
    );
  }
}
