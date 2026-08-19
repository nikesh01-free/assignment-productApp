import 'package:flutter/material.dart';
import 'package:product_application/model/product_model.dart';
import 'package:product_application/services/fetch_product.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductsModel?> productsModel = [];
  bool isLoading = false;
  void getProduct() async {
    isLoading = true;
    notifyListeners();

    try {
      productsModel = await ApiServices().fetchproduct();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void addProduct(ProductsModel product) {
    productsModel.insert(0, product);
    notifyListeners();
  }

  void toggleFavoriteStatus(ProductsModel product) {
    product.isFavorite = !product.isFavorite!;

    notifyListeners();
  }
}
