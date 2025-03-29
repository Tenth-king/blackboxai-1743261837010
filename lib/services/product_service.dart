import '../models/product.dart';

class ProductService {
  static final List<Product> _products = [
    Product(
      id: 1,
      name: 'Organic Fuji Apples',
      price: 3.99,
      imageUrl: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb',
      category: 'Fruits',
      description: 'Crisp and sweet organic apples from local farms',
      rating: 4.5,
      unit: 'lb',
    ),
    Product(
      id: 2,
      name: 'Banana Bunch',
      price: 1.29,
      imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e',
      category: 'Fruits',
      description: 'Fresh yellow bananas, perfect for snacks or smoothies',
      rating: 4.2,
      unit: 'each',
    ),
    Product(
      id: 3,
      name: 'Whole Milk',
      price: 3.49,
      imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150',
      category: 'Dairy',
      description: 'Fresh whole milk, 1 gallon',
      rating: 4.3,
      unit: 'gallon',
    ),
    Product(
      id: 4,
      name: 'Free Range Eggs',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1587486913049-53fc88980dfa',
      category: 'Dairy',
      description: 'Dozen large free range eggs',
      rating: 4.7,
      unit: 'dozen',
    ),
    Product(
      id: 5,
      name: 'Whole Wheat Bread',
      price: 2.99,
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff',
      category: 'Bakery',
      description: 'Freshly baked whole wheat bread',
      rating: 4.4,
      unit: 'loaf',
    ),
  ];

  static List<Product> getProducts() {
    return _products;
  }

  static List<Product> getProductsByCategory(String category) {
    return _products.where((p) => p.category == category).toList();
  }

  static List<String> getCategories() {
    return _products.map((p) => p.category).toSet().toList();
  }

  static List<Product> searchProducts(String query) {
    return _products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}