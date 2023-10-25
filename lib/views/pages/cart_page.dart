import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cartItems = Hive.box('cart_box');

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
      body: _cartItems.length > 0
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'My Cart',
                  style: appStyle(fw: FontWeight.bold, size: 32),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                  padding: const  EdgeInsets.only(left: 8),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: _cartItems.getAt(index)["image"],
                                    fit: BoxFit.contain,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      _cartItems.getAt(index)['name'],
                                      style: appStyle(
                                          fw: FontWeight.bold, size: 19),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      _cartItems.getAt(index)['category'],
                                      style: appStyle(
                                          fw: FontWeight.bold,
                                          size: 15,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      "\$${_cartItems.getAt(index)['price']}",
                                      style: appStyle(
                                          fw: FontWeight.bold,
                                          size: 14,
                                          color: Colors.blueGrey),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    _cartItems.deleteAt(index);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CartPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text(
                            "Proceed to Checkout",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 20,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                )
              ),
            ])
          : Center(
              child: Text(
                "No Items in Cart",
                style: appStyle(fw: FontWeight.bold, size: 32),
              ),
            ),
    );
  }
}
