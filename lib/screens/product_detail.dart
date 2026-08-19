import 'package:flutter/material.dart';
import 'package:product_application/model/product_model.dart';
import 'package:product_application/providers/product_provider.dart';
import 'package:product_application/widgets/app_textstyle.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});

  final ProductsModel? product;

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final screenSize = MediaQuery.sizeOf(context);
    final horizontalPadding = screenSize.width * 0.02;
    final imageHeight = screenSize.height * 0.35;
    return Scaffold(
      appBar: AppBar(title: Text(product?.title ?? 'Product Detail')),
      body: Padding(
        padding: EdgeInsets.all(horizontalPadding),
        child: Column(
          spacing: screenSize.height * 0.02,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  child: Image.network(
                    product?.thumbnail ?? '',
                    width: screenSize.width,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 7,
                  top: 7,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          product?.isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          productProvider.toggleFavoriteStatus(product!);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product?.title ?? 'No Title',
                    style: AppTextStyle.basic.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenSize.width * 0.025),
                Text(
                  product?.category ?? 'No Category',
                  style: AppTextStyle.basic.copyWith(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Text(
              product?.description ?? 'No Description',
              style: AppTextStyle.basic.copyWith(
                color: Colors.grey.shade700,

                fontSize: 16,

                height: 2,
              ),
            ),
            Spacer(),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    'Price: \$${product?.price ?? 0}',
                    style: AppTextStyle.medium,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Product added to cart'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            "Add to Cart",
                            style: AppTextStyle.basic.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
