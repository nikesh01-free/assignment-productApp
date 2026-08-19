import 'package:flutter/material.dart';
import 'package:product_application/model/product_model.dart';
import 'package:product_application/providers/product_provider.dart';
import 'package:product_application/widgets/product_card.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    final wishlistProducts = provider.productsModel
        .whereType<ProductsModel>()
        .where((product) => product.isFavorite == true)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: wishlistProducts.isEmpty
          ? const Center(child: Text('Your wishlist is empty'))
          : ListView.builder(
              itemCount: wishlistProducts.length,
              itemBuilder: (context, index) {
                final product = wishlistProducts[index];

                return ProductCard(
                  image: product.thumbnail ?? '',
                  name: product.title ?? '',
                  price: product.price ?? 0,
                  description: product.description ?? '',
                  category: product.category ?? '',
                  isFavorite: product.isFavorite ?? false,
                  onPressed: () {
                    provider.toggleFavoriteStatus(product);
                  },
                  onTap: () {
                    // Navigate to ProductDetailScreen here
                  },
                );
              },
            ),
    );
  }
}
