class StoreItemModel {
  final List images;
  final String name;
  final int price;
  final double rating;
  final String description;
  final List specs;
  final List reviews;
  final List types;

  const StoreItemModel(
      {required this.images,
      required this.name,
      required this.price,
      required this.rating,
      required this.description,
      required this.specs,
      required this.reviews,
      required this.types});

  static const List storeItems = [
    StoreItemModel(
        images: ["assets/images/backpack.webp"],
        name: "Рюкзак Mr. Skinner Летнее настроение",
        price: 1775,
        rating: 4.9,
        description: "Рюкзак Mr. Skinner Летнее настроение",
        specs: ["Ткань", "Унисекс"],
        reviews: [],
        types: ["Серый", "Синий"]),
    StoreItemModel(
        images: ["assets/images/gas.webp"],
        name: "Моторное масло TAKAYAMA",
        price: 1992,
        rating: 4.6,
        description:
            "Синтетическое всесезонное моторное масло TAKAYAMA SAE 5W-30 API SL/CF",
        specs: ["5W-30", "4", "Синтетическое"],
        reviews: [],
        types: ["1 л", "4 л", "20 л"]),
    StoreItemModel(
        images: ["assets/images/coffee.webp"],
        name: "Кофе молотый Жокей По-восточному",
        price: 354,
        rating: 4.9,
        description:
            "Уникальный бленд сортов Арабики из Бразилии, Эфиопии и Индии.",
        specs: ["Арабика"],
        reviews: [],
        types: ["100 г", "250 г", "450 г"]),
  ];
}
