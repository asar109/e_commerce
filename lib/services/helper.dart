import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/services.dart';

class Helper {
Future<List<Sneakers>> getMaleData ()async {
  final res = await rootBundle.loadString('assets/data.json');
  final data = sneakersFromJson(res) ;
  return data;
}
Future<List<Sneakers>> getFemaleData ()async {
  final res = await rootBundle.loadString('assets/data_female.json');
  final data = sneakersFromJson(res) ;
  return data;
}
Future<List<Sneakers>> getKidsData ()async {
  final res = await rootBundle.loadString('assets/data_kids.json');
  final data = sneakersFromJson(res) ;
  return data;
}
Future<List<Sneakers>> getMaleSneakerById (id)async {
  final res = await rootBundle.loadString('assets/data.json');
  final data = sneakersFromJson(res) ;
  data.firstWhere((element) => element.id == id);
  return data;
}
Future<List<Sneakers>> getFemaleSneakerById (id)async {
  final res = await rootBundle.loadString('assets/data_female.json');
  final data = sneakersFromJson(res) ;
  data.firstWhere((element) => element.id == id);
  return data;
}
Future<List<Sneakers>> getkidSneakerById (id)async {
  final res = await rootBundle.loadString('assets/data_kids.json');

  final data = sneakersFromJson(res) ;
  data.firstWhere((element) => element.id == id);
  return data;
}

}