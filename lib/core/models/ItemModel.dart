// ignore_for_file: file_names

var data = [
  {
    "name": "Dell",
    "price": 25.0,
    "fav": false,
    "rating": 4.5,
    "image": 'images/dell.png'
  },
  {
    "name": "Mac",
    "price": 200.0,
    "fav": false,
    "rating": 4.5,
    "image": 'images/mac.png'
  },
  {
    "name": "Hp",
    "price": 299.0,
    "fav": false,
    "rating": 4.5,
    "image": 'images/hp.png'
  },
  {
    "name": "Mike",
    "price": 3001.0,
    "fav": false,
    "rating": 3.5,
    "image": 'images/mike.png'
  },
  {
    "name": "Desktop Setup",
    "price": 25.0,
    "fav": false,
    "rating": 4.5,
    "image": 'images/desktop.png'
  },
  {
    "name": "Speaker",
    "price": 214.0,
    "fav": false,
    "rating": 4.0,
    "image": 'images/speaker.png'
  },
];

class ShoppingItem {
  String name;
  double price;
  bool fav;
  double rating;
  String image;
  int id;
  int? shopId;

  ShoppingItem(
      {this.shopId,
      required this.id,
      required this.fav,
      required this.rating,
      required this.price,
      required this.image,
      required this.name});

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
