
import 'dart:convert';

// 

List<Sneakers> sneakersFromJson(String str) => List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

class Sneakers {
    final String id;
    final String name;
    final String title;
    final String price;
    final String description;
    final String category;
    final List<String> imageUrl;
    final String oldPrice;
    final List<dynamic> sizes;

    Sneakers({
        required this.id,
        required this.name,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.imageUrl,
        required this.oldPrice,
        required this.sizes,
    });

    factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
    );


}


