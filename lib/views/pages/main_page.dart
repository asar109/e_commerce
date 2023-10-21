import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/provider/main_screeen_provider.dart';
import 'package:e_commerce/views/pages/cart_page.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/profile_page.dart';
import 'package:e_commerce/views/pages/search_page.dart';
import 'package:e_commerce/views/shared/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return Scaffold(
          backgroundColor: GlobalVariables.myBackgroundColor,
          bottomNavigationBar: BottomNavBar(
            key: super.key,
          ),
          body: pageList[mainScreenProvider.selectedIndex],
        );
      },
    );
  }
}
