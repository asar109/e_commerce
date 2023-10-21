import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/views/shared/product_details_widget.dart';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {super.key, required this.id, required this.category});
  final String id;
  final String category;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final PageController page = PageController();

  late Future<List<Sneakers>> _sneaker;

  void getData() {
    if (widget.category == "Men's Running") {
      _sneaker = Helper().getMaleSneakerById(widget.id);
    } else if (widget.category == '') {
      _sneaker = Helper().getFemaleSneakerById(widget.id);
    } else {
      _sneaker = Helper().getkidSneakerById(widget.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _sneaker,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final sneaker = snapshot.data![0];
          return Consumer<ProductNotifier>(
            builder: (context, productNotifier, child) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.grey[300],
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    snap: false,
                    leadingWidth: 0,
                    expandedHeight: MediaQuery.of(context).size.height,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            AntIcons.closeOutlined,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Ionicons.ellipsis_horizontal),
                        ),
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.43,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                              controller: page,
                              itemCount: sneaker.imageUrl.length,
                              onPageChanged: (value) {
                                productNotifier.setActivePage = value;
                              },
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey[300],
                                      child: CachedNetworkImage(
                                        imageUrl: sneaker.imageUrl[0],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      right: 24,
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 24,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                              sneaker.imageUrl.length,
                                              (index) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4),
                                                    child: CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor:
                                                            productNotifier
                                                                        .activepage ==
                                                                    index
                                                                ? Colors.black
                                                                : Colors.grey),
                                                  )),
                                        )),
                                  ],
                                );
                              },
                            ),
                          ),
                          ProductDetailsWidget(
                            name: sneaker.name,
                            category: sneaker.category,
                            ratings: 4,
                            price: sneaker.price,
                            color: "red",
                            size: const [
                              {"size": 0.8},
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
    ));
  }
}
