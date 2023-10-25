import 'package:e_commerce/provider/favorite_box_provider.dart';
import 'package:e_commerce/provider/main_screeen_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/views/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('fav_box');
  await Hive.openBox('cart_box');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ProductNotifier(),
    ),
    ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_Commerce',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
         const  DropdownAlert(
            successBackground: Colors.white,
            contentStyle: TextStyle(color: Colors.black),
            titleStyle: TextStyle(color: Colors.black),
            position: AlertPosition.BOTTOM,
            
          )
        ],
      ),
      home: const MainPage(),
    );
  }
}
