class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description;
  final double rating;
  final String unit;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    this.rating = 0.0,
    this.unit = 'each',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      description: json['description'],
      rating: json['rating']?.toDouble() ?? 0.0,
      unit: json['unit'] ?? 'each',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'imageUrl': imageUrl,
    'category': category,
    'description': description,
    'rating': rating,
    'unit': unit,
  };
}