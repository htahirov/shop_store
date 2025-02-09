import '../../../utils/constants/app_assets.dart';

class HomeCardModel {
  final String title;
  final String imagePath;
  final double amount;

  HomeCardModel({
    required this.title,
    required this.imagePath,
    required this.amount,
  });

  static List<HomeCardModel> sampleList = [
    HomeCardModel(title: 'Sez Brimmed Hat', imagePath: AppAssets.gridImage1, amount: 34),
    HomeCardModel(title: 'Warm Zipper', imagePath: AppAssets.gridImage2, amount: 300.0),
    HomeCardModel(title: 'Gramercy Dress', imagePath: AppAssets.gridImage3, amount: 120.0),
    HomeCardModel(title: 'Zestos Belt', imagePath: AppAssets.gridImage4, amount: 300.0),
  ];
}
