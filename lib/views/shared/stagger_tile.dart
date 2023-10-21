import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggerdWidget extends StatelessWidget {
  const StaggerdWidget({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final shoe = snapshot.data;
          return Container(
            margin: const EdgeInsets.all(8),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: shoe!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: (index % 2 == 0)
                      ? MediaQuery.of(context).size.height * 0.32
                      : MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(153, 255, 250, 250),
                        blurRadius:2,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: CachedNetworkImage(
                            imageUrl: shoe[index].imageUrl[0],
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                shoe[index].name,
                                maxLines: 2,
                                softWrap: true,
                                style: appStyleWithHeight(fw: FontWeight.w700, size:22, height: 1)
                                    .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, bottom: 2),
                              child: Text('\$${shoe[index].price}',
                                  maxLines: 1,
                                  style:appStyleWithHeight(fw: FontWeight.w600, size:16, height: 1.4)
                                    .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
