import 'package:e_commerce/provider/main_screeen_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/views/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
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
      home: const MainPage(),
    );
  }
}
