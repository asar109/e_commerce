import 'package:e_commerce/provider/main_screeen_provider.dart';
import 'package:e_commerce/views/shared/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: const Color.fromARGB(255, 0, 0, 0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavWidget(
                onTap: () => mainScreenProvider.setIndex = 0,
                icon: mainScreenProvider.selectedIndex == 0
                    ? Ionicons.home
                    : Ionicons.home_outline,
                size: mainScreenProvider.selectedIndex == 0 ? 28 : 24,
              ),
              BottomNavWidget(
                icon: mainScreenProvider.selectedIndex == 1
                    ? Ionicons.search
                    : Ionicons.search_outline,
                onTap: () => mainScreenProvider.setIndex = 1,
                size: mainScreenProvider.selectedIndex == 1 ? 28 : 24,
              ),
              BottomNavWidget(
                icon: mainScreenProvider.selectedIndex == 2
                    ? Ionicons.heart
                    : Ionicons.heart_circle_outline,
                onTap: () => mainScreenProvider.setIndex = 2,
                size: mainScreenProvider.selectedIndex == 2 ? 28 : 24,
              ),
              BottomNavWidget(
                icon: mainScreenProvider.selectedIndex == 3
                    ? Ionicons.cart
                    : Ionicons.cart_outline,
                onTap: () => mainScreenProvider.setIndex = 3,
                size: mainScreenProvider.selectedIndex == 3 ? 28 : 24,
              ),
              BottomNavWidget(
                icon: mainScreenProvider.selectedIndex == 4
                    ? Ionicons.person
                    : Ionicons.person_outline,
                onTap: () => mainScreenProvider.setIndex = 4,
                size: mainScreenProvider.selectedIndex == 4 ? 28 : 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
