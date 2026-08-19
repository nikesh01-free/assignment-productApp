import 'package:flutter/material.dart';
import 'package:product_application/providers/product_provider.dart';
import 'package:product_application/widgets/app_textstyle.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.onTap,
    required this.onPressed,
    required this.isFavorite,
  });
  String image =
      "https://images.pexels.com/photos/3907507/pexels-photo-3907507.jpeg?cs=srgb&dl=pexels-alex-azabache-3907507.jpg&fm=jpg";
  String name = "Product";
  double price;
  bool isFavorite = false;
  String description;
  String category = "Category";
  void Function()? onPressed;
  void Function()? onTap;
  List<Map<String, dynamic>> productsInCart = [];
  void addToCart() {
    productsInCart.add({
      "image": image,
      "name": name,
      "price": price,
      "description": description,
      "category": category,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0.30,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 130,
              width: 120,
              child: ClipRRect(
                borderRadius: .circular(20),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${name}",
                        style: AppTextStyle.basic.copyWith(fontSize: 18),
                      ),
                      Text(
                        "Price: ${price}",
                        style: AppTextStyle.basic.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${description}",
                        style: AppTextStyle.basic.copyWith(
                          fontSize: 14,

                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: isFavorite
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      addToCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product added to cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: AppTextStyle.basic.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
