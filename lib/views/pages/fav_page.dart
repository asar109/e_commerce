import 'package:e_commerce/global_variables.dart';
import 'package:flutter/material.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.myBackgroundColor,
      appBar: AppBar(
          backgroundColor: GlobalVariables.myBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: const Center(
        child: Text('Favourite Page'),
      ),
    );
  }
}