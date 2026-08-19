import 'package:flutter/material.dart';
import 'package:product_application/providers/product_provider.dart';
import 'package:product_application/screens/add_product.dart';
import 'package:product_application/screens/product_detail.dart';
import 'package:product_application/screens/wishlist_screen.dart';
import 'package:product_application/widgets/my_app_button.dart';
import 'package:product_application/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ProductProvider>().getProduct();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final categories = productProvider.productsModel
        .map((product) => product?.category)
        .where((category) => category != null)
        .toSet()
        .toList();
    final addToCart = productProvider.productsModel
        .where((product) => product?.isFavorite == true)
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );

          if (newProduct != null) {
            context.read<ProductProvider>().addProduct(newProduct);
          }
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MyAppButton(
                    text: categories[index] ?? '',
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Visibility(
              visible: !productProvider.isLoading,
              replacement: Center(child: CircularProgressIndicator()),
              child: Expanded(
                child: ListView.builder(
                  itemCount: productProvider.productsModel.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.productsModel[index];
                    return ProductCard(
                      onPressed: () {
                        productProvider.toggleFavoriteStatus(product!);
                      },
                      isFavorite: product?.isFavorite ?? false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      image: product?.thumbnail ?? '',
                      name: product?.title ?? '',
                      price: product?.price ?? 0,
                      description: product?.description ?? '',
                      category: product?.category ?? '',
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
