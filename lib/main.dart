import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'models/cart_item.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/checkout_screen.dart';
import 'services/product_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'cart',
              builder: (context, state) => const CartScreen(),
            ),
            GoRoute(
              path: 'product/:id',
              builder: (context, state) {
                final productId = int.parse(state.pathParameters['id']!);
                final product = ProductService.getProducts()
                    .firstWhere((p) => p.id == productId);
                return ProductDetailScreen(product: product);
              },
            ),
            GoRoute(
              path: 'checkout',
              builder: (context, state) => const CheckoutScreen(),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'FreshMart Grocery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
