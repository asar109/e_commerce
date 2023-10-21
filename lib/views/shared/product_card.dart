import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.name,
      required this.category,
      required this.price,
      required this.image,
      required this.id});

  final String name;
  final String category;
  final String price;
  final String image;
  final String id;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final bool selected = true;

  @override
  Widget build(BuildContext context) {   return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(right: 8, top: 8),
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                    )
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        // TODO:
                        onTap: () => print('Favorite'),
                        // ignore: prefer_const_constructors
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: appStyleWithHeight(
                      fw: FontWeight.bold,
                      size: 28,
                      color: Colors.black.withOpacity(0.8),
                      height: 1.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.category,
                  maxLines: 1,
                  style: appStyleWithHeight(
                      fw: FontWeight.bold,
                      size: 16,
                      color: Colors.black38,
                      height: 1.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${widget.price}',
                        style: appStyle(
                            fw: FontWeight.bold,
                            size: 20,
                            color: Colors.black.withOpacity(0.8))),
                    const Row(
                      children: [
                        Text('Colors'),
                        SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: Text(' '),
                          selected: false,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Color.fromARGB(255, 19, 19, 19),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}