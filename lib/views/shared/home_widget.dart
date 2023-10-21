import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/pages/product_by_cart.dart';
import 'package:e_commerce/views/shared/latest_product_card.dart';
import 'package:e_commerce/views/shared/product_card.dart';
import 'package:e_commerce/views/shared/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.index,
  }) : _male = male;

  final int index;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            child: FutureBuilder(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error:  ${snapshot.error}'));
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.68,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(id: shoe.id, category: shoe.category),));
                            },
                            child: ProductCard(
                              name: shoe.name,
                              price: shoe.price,
                              image: shoe.imageUrl[0],
                              category: shoe.category,
                              id: shoe.id,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Latest Shows',
                style: appStyle(
                    fw: FontWeight.bold, size: 20, color: Colors.black54),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductByCart(index: index)));
              },
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: appStyle(
                        fw: FontWeight.w600, size: 17, color: Colors.black54),
                  ),
                  const Icon(Ionicons.caret_forward_outline,
                      size: 16, color: Colors.black54),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: FutureBuilder(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final shoe = snapshot.data;
                  return ListView.builder(
                    itemCount: shoe!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: LatestProductCard(
                            imageUrl: shoe.imageUrl[0],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ))
      ],
    );
  }
}
