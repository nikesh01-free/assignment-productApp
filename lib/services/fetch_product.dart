import 'dart:convert';

import 'package:product_application/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String url = "https://dummyjson.com/products";
  Future<List<ProductsModel?>> fetchproduct() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsondecode = jsonDecode(response.body);
        List products = jsondecode['products'];
        final productData = products
            .map((product) => ProductsModel.fromJson(product))
            .toList();
        return productData;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  Future<ProductsModel> addProduct(Map body) async {
    var response = await http.post(
      Uri.parse('$url/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode == 201) {
      ProductsModel product = ProductsModel.fromJson(jsonDecode(response.body));

      return product;
    }

    throw Exception('Failed to add product: ${response.statusCode}');
  }
}
