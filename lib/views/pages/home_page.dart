import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/views/shared/home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.myBackgroundColor,
      body: Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.48,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top_img.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
                    child: Text('Athletics Shoes',
                        style: appStyleWithHeight(
                            fw: FontWeight.bold,
                            height: 1.2,
                            color: Colors.white,
                            size: 36)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 20),
                    child: Text('Collection',
                        style: appStyleWithHeight(
                            fw: FontWeight.bold,
                            height: 1.2,
                            color: Colors.white,
                            size: 32)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
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
                  ),
                ],
              )),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.26),
            child: TabBarView(controller: _tabController, children: [
              HomeWidget(
                male: _male,
                index: 0,
              ),
              HomeWidget(
                male: _feMale,
                index: 1,
              ),
              HomeWidget(
                male: _kids,
                index: 2,
              ),
            ]),
          )
        ]),
      ),
    )
    );
    }
}
