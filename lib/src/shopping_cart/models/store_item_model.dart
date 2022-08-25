class StoreItemModel {
  final List images;
  final String name;
  final int price;
  final double rating;
  final String description;
  final Map<String, String> specs;
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
        specs: {
          "Цвет": "бежевый",
          "Материал": "Вельвет, Текстиль, Ткань",
          "Размер рюкзака": "Маленький (до 20 л.)"
        },
        reviews: [],
        types: ["Серый", "Синий"]),
    StoreItemModel(
        images: ["assets/images/gas.webp"],
        name: "Моторное масло TAKAYAMA",
        price: 1992,
        rating: 4.6,
        description:
            "Синтетическое всесезонное моторное масло TAKAYAMA SAE 5W-30 API SL/CF",
        specs: {
          "Вязкость по SAE": "5W-30",
          "Объем, л": "4",
          "Вид масла": "Синтетическое"
        },
        reviews: [],
        types: ["1 л", "4 л", "20 л"]),
    StoreItemModel(
        images: ["assets/images/coffee.webp"],
        name: "Кофе молотый Жокей По-восточному",
        price: 354,
        rating: 4.9,
        description:
            "Уникальный бленд сортов Арабики из Бразилии, Эфиопии и Индии.",
        specs: {
          "Тип кофе": "Кофе молотый",
          "Состав кофе": "Арабика",
          "Степень обжарки": "Темная"
        },
        reviews: [],
        types: ["100 г", "250 г", "450 г"]),
  ];
}
