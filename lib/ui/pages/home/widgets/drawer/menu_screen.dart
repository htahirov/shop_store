import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/cubits/profile/profile_cubit.dart';
import '../../../../../utils/helpers/go.dart';
import '../../../../../utils/helpers/pager.dart';
import 'drawer_item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedItem = "Women";

  void _onDrawerItemTap(String title) {
    setState(() {
      selectedItem = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/logo/profile.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Braxton Stark",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "braxton@gmail.com",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 30),
              DrawerItem(
                title: "Profile",
                isActive: selectedItem == "Profile",
                onTap: () => Go.to(context, Pager.profile),
              ),
              DrawerItem(
                title: "Address",
                isActive: selectedItem == "Address",
                onTap: () => _onDrawerItemTap("New Arrival"),
              ),
              DrawerItem(
                title: "Payment method",
                isActive: selectedItem == "Payment method",
                onTap: () => _onDrawerItemTap("Women"),
              ),
              DrawerItem(
                title: "Password",
                isActive: selectedItem == "Password",
                onTap: () => _onDrawerItemTap("Men"),
              ),
              DrawerItem(
                title: "My Order",
                isActive: selectedItem == "My Order",
                onTap: () => _onDrawerItemTap("Accessories"),
              ),
              DrawerItem(
                title: "Invite friends",
                isActive: selectedItem == "Invite friends",
                onTap: () => _onDrawerItemTap("Jewellery"),
              ),
              DrawerItem(
                title: "Log out",
                isActive: selectedItem == "Log out",
                onTap: () => _onDrawerItemTap("Jewellery"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
