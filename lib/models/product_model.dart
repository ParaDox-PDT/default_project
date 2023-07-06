class ProductModelFields {
  static const String id = "_id";
  static const String title = "title";
  static const String img = "img";
  static const String price = "price";
  static const String skidka = "skidka";
  static const String count = "count";
  static const String isTapped = "isTapped";
  static const String isLiked = "isLiked";

  static const String contactsTable = "my_products";
}

class ProductsModel {
  int? id;
  final String img;
  final String title;
  final String price;
  final String skidka;
  int count;
  int isTapped;
  int isLiked;

  ProductsModel({
    required this.img,
    required this.title,
    required this.price,
    required this.skidka,
    this.isLiked = 0,
    this.count = 1,
    this.isTapped = 0,
    this.id
  });

  ProductsModel copyWith({
    String? img,
    String? title,
    String? price,
    String? skidka,
    int? count,
    int? isTapped,
    int? isLiked,
    int? id,
  }) {
    return ProductsModel(img: img ?? this.img,
        title: title ?? this.title,
        price: price ?? this.price,
        skidka: skidka ?? this.skidka,
        isLiked: isLiked ?? this.isLiked,
        count: count ?? this.count,
        isTapped: isTapped ?? this.isTapped,
        id: id ?? this.id
    );
  }

  factory ProductsModel.fromJson(Map<String, dynamic>json){
    return ProductsModel(
      img: json[ProductModelFields.img] ?? "",
      title: json[ProductModelFields.title] ?? "",
      price: json[ProductModelFields.price] ?? "",
      skidka: json[ProductModelFields.skidka] ?? "",
      id: json[ProductModelFields.id] ?? 0,
      isTapped: json[ProductModelFields.isTapped] ?? 0,
      count: json[ProductModelFields.count] ?? 0,
      isLiked: json[ProductModelFields.isLiked] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      ProductModelFields.title:title,
      ProductModelFields.isLiked:isLiked,
      ProductModelFields.isTapped:isTapped,
      ProductModelFields.img:img,
      ProductModelFields.price:price,
      ProductModelFields.skidka:skidka,
      ProductModelFields.count:count,
    };
  }

  @override
  String toString() {
    return '''
      title:$title,
      price:$price,
      img:$img,
      skidka:$skidka,
      count:$count,
      isLiked:$isLiked,
      isTapped:$isTapped,
      id:$id 
    ''';
  }
}
