import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/provider/favorite_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child) {
        final _favorites = favoriteProvider.favorites.reversed.toList();
        return Scaffold(
          backgroundColor: GlobalVariables.myBackgroundColor,
          appBar: AppBar(
              backgroundColor: GlobalVariables.myBackgroundColor,
              elevation: 0,
              leadingWidth: 300,
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "My Favorites",
                  style: appStyle(fw: FontWeight.bold, size: 22),
                ),
              )),
          body: ListView.builder(
            itemCount: favoriteProvider.favorites.length,
            itemBuilder: (context, index) {
              final favorite = _favorites[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 100,
                        child: Image.asset(
                          'assets/images/m_1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 16),
                              child: Text(
                                "${favorite['name']}",
                                maxLines: 1,
                                style: appStyleWithHeight(
                                    fw: FontWeight.bold, size: 18, height: 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 16),
                              child: Text(
                                // _favorites[index].category,
                                "${favorite['category']}",
                                style: appStyleWithHeight(
                                    fw: FontWeight.bold, size: 12, height: 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 16),
                              child: Text(
                                "\$ ${favorite['price']}",
                                style: appStyleWithHeight(
                                    fw: FontWeight.bold,
                                    size: 14,
                                    height: 1,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 100,
                        child: GestureDetector(
                          onTap: () {
                            favoriteProvider.removeFavorite(favorite['id']);
                          },
                          child: const Icon(
                            Ionicons.heart_dislike_circle_outline,
                            size: 28,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
