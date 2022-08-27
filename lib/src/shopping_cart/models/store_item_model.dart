import 'package:cloud_firestore/cloud_firestore.dart';

class StoreItemModel {
  final List images;
  final String name;
  final int price;
  final double rating;
  final String description;
  final Map<String, dynamic> specs;
  final List reviews;
  final Map<String, dynamic> types;

  const StoreItemModel(
      {required this.images,
      required this.name,
      required this.price,
      required this.rating,
      required this.description,
      required this.specs,
      required this.reviews,
      required this.types});

  static StoreItemModel fromSnapshot(DocumentSnapshot snapshot) {
    StoreItemModel storeItem = StoreItemModel(
        images: snapshot['images'],
        name: snapshot['name'],
        price: snapshot['price'],
        rating: snapshot['rating'],
        description: snapshot['description'],
        specs: snapshot['specs'],
        reviews: [],
        types: snapshot['types']);

    return storeItem;
  }
}
