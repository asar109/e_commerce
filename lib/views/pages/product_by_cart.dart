import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/views/shared/fiter_method.dart';
import 'package:e_commerce/views/shared/stagger_tile.dart';
import 'package:flutter/material.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.index});
  final int index;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _contorller = TabController(
    length: 3,
    vsync: this,
  );

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _feMale;
  late Future<List<Sneakers>> _kids;

  void getMaleData() {
    _male = Helper().getMaleData();
  }

  void getFemaleData() {
    _feMale = Helper().getFemaleData();
  }

  void getKidData() {
    _kids = Helper().getKidsData();
  }

  @override
  void initState() {
    super.initState();
    getMaleData();
    getFemaleData();
    getKidData();
  }

  @override
  Widget build(BuildContext context) {
    _contorller.index = widget.index;
    return Scaffold(
      backgroundColor: GlobalVariables.myBackgroundColor,
      body: SizedBox(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.48,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: GlobalVariables.myBackgroundColor,
              image: DecorationImage(
                image: AssetImage('assets/images/top_img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print(Navigator.);
                        Navigator.pop(context );
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        filter(context);
                      },
                      child: const Icon(
                        AntIcons.slidersFilled,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
                controller: _contorller,
                isScrollable: true,
                labelColor: Colors.white,
                labelStyle: appStyle(fw: FontWeight.bold, size: 24),
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                tabs: const [
                  Tab(text: 'Men shoes'),
                  Tab(text: 'Woman Shoes'),
                  Tab(text: 'Kids Shoes'),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              child: TabBarView(controller: _contorller, children: [
                StaggerdWidget(male: _male),
                StaggerdWidget(male: _feMale),
                StaggerdWidget(male: _kids),
              ]),
            ),
          ),
        ],
      )),
    );
  }
}
