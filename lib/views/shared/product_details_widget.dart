import 'package:e_commerce/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    required this.name,
    required this.ratings,
    required this.category,
    required this.size,
    required this.price,
    required this.color,
    required this.image,
    required this.id,
    
  });
  final String name;
  final int ratings;
  final String category;
  final List<dynamic> size;
  final String price;
  final String color;
  final String image;
  final String id;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  void _addtoCartController() async {
    var cartBox = Hive.box('cart_box');
    await cartBox.add({
      'name': widget.name,
      'price': widget.price,
      'color': widget.color,
      'size': widget.size,
      'category': widget.category,
      'ratings': widget.ratings,
      'image': widget.image,
      'id': widget.id,
    });

    AlertController.show(
        "Added to Cart", "Item added to cart successfully", TypeAlert.success);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.62,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    widget.name,
                    style: appStyleWithHeight(
                        fw: FontWeight.bold, size: 28, height: 1.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(widget.category,
                              style: appStyleWithHeight(
                                  fw: FontWeight.bold,
                                  size: 16,
                                  height: 1.2,
                                  color: Colors.black54)),
                        ),
                        RatingBar.builder(
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          initialRating: 4.5,
                          maxRating: 5,
                          itemSize: 16,
                          unratedColor: Colors.grey[400],
                          glowColor: Colors.amber,
                          itemBuilder: (context, index) {
                            return const Icon(Icons.star);
                          },
                          onRatingUpdate: (value) {},
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            '\$${widget.price} ',
                            style: appStyleWithHeight(
                                fw: FontWeight.bold, size: 18, height: 1.2),
                          ),
                        ),
                        const Row(
                          children: [
                            Text('Colors'),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.black,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.red,
                            )
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select Size",
                        style: appStyle(fw: FontWeight.bold, size: 16),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'View size guide',
                        style: appStyle(
                            fw: FontWeight.bold, size: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                    child: SizedBox(
                      height: 60,
                      child: Text('Size Guide'),
                    )),
                const Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Lorem ipsum text of sneaker to the point',
                    textAlign: TextAlign.justify,
                    style: appStyleWithHeight(
                        fw: FontWeight.w700, size: 20, height: 1.2),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random lorem ipsum of the text random ',
                    textAlign: TextAlign.justify,
                    maxLines: 7,
                    overflow: TextOverflow.fade,
                    style: appStyleWithHeight(
                        fw: FontWeight.w400, size: 13, height: 1.2),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      _addtoCartController();
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
                            "Add to Cart",
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
              ],
            ),
          ),
        ));
  }
}
