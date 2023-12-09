class Product {
  late final int id;
  late final String title;
  late final Map<String, String> description;
  late final String image;
  late final List<String> images;
  late final List<int> quantity;
  late final double rating;
  late final double price;
  late final String category;
  late bool isFavourite, isPopular;
  // late DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.quantity,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.price,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'images': images,
      'category': category,
      'quantity': quantity,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
    };
  }

  Product.fromMap(dynamic map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['image'];
    category = map['category'];
    images = map['images'];
    quantity = map['quantity'];
    rating = map['rating'];
    price = map['price'];
    isFavourite = map['isFavourite'];
    isPopular = map['isPopular'];
  }
  Product toEntity() => Product(
        id: id,
        title: title,
        description: description,
        image: image,
        images: images,
        category: category,
        quantity: quantity,
        rating: rating,
        price: price,
        isFavourite: isFavourite,
        isPopular: isPopular,
      );
}
// Demo data

List<Product> demoProducts = [
  Product(
    id: 1,
    image: "assets/images/fruits.png",
    images: [
      "assets/images/fruits.png",
      "assets/images/fruits.png",
      "assets/images/fruits.png",
    ],
    category: "Clock , Wearable",
    quantity: quantity,
    title: "Apple",
    price: 64.99,
    description: {"headline": "Fresh fruits", "description": description},
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    image: "assets/images/vegetables.png",
    images: [
      "assets/images/vegetables.png",
      "assets/images/vegetables.png",
    ],
    category: "vegetables",
    quantity: quantity,
    title: "Broccoli",
    price: 50.5,
    description: {"headline": "Green Vegetables", "description": description},
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    image: "assets/images/salad.png",
    images: [
      "assets/images/salad.png",
    ],
    category: "salad",
    quantity: quantity,
    title: "Salad",
    price: 20.20,
    description: {"headline": "salad Products", "description": description},
    rating: 4.1,
    isFavourite: false,
  ),
  Product(
    id: 4,
    image: "assets/images/juice.png",
    images: [
      "assets/images/juice.png",
      "assets/images/juice.png",
    ],
    category: "juice",
    quantity: quantity,
    title: "Juice",
    price: 36.55,
    description: {"headline": "juice", "description": description},
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "fresh fruits and vegetables are the best source of vitamins and minerals. People who eat a healthy amount of fruits and vegetables each day have a reduced risk of chronic diseases. Fruits and vegetables contain essential nutrients for a healthy body. We are providing fresh fruits and vegetables to our customers.";

List<int> quantity = [3, 4, 5];
