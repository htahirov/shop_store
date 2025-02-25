import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/cubits/main/main_cubit.dart';
import 'package:shop_store/ui/widgets/custom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, int>(
        builder: (_, i) => pages[i],
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, int>(
        builder: (_, i) => CustomNavBar(activeIndex: i),
      ),
    );
  }
}

final List<Widget> pages = [
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.yellow,
  ),
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.blue,
  ),
];
