import 'package:flutter/material.dart';
import 'package:product_application/model/product_model.dart';
import 'package:product_application/services/fetch_product.dart';
import 'package:product_application/widgets/app_textformfield.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyTextFormField(
                  labelText: 'Product Name',
                  hintText: 'e.g. iPhone, Samsung Galaxy',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add Product Name';
                    } else if (value.length < 2) {
                      return 'The name should be at least 2 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        labelText: 'Price',
                        hintText: 'e.g. 999.99',
                        controller: _priceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Add price';
                          }

                          if (double.tryParse(value) == null) {
                            return 'Enter a valid price';
                          }

                          return null;
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: MyTextFormField(
                        labelText: 'Category',
                        hintText: 'e.g. Electronics, Clothing',
                        controller: _categoryController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Add category';
                          } else if (value.length < 2) {
                            return 'The category should be at least 2 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                MyTextFormField(
                  labelText: 'Description',
                  hintText: 'e.g. A brief description of the product',
                  controller: _descriptionController,
                  maxline: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add description';
                    } else if (value.length < 10) {
                      return 'The description should be at least 10 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                MyTextFormField(
                  labelText: 'Image URL',
                  hintText: 'e.g. https://example.com/image.jpg',
                  controller: _imageUrlController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Add image URL';
                    }

                    if (!Uri.parse(value).isAbsolute) {
                      return 'Please enter a valid URL';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final apiServices = ApiServices();

                        ProductsModel product = await apiServices.addProduct({
                          "title": _nameController.text,
                          "price": double.parse(_priceController.text),
                          "category": _categoryController.text,
                          "description": _descriptionController.text,
                          "thumbnail": _imageUrlController.text,
                        });

                        print("Product added: ${product.title}");

                        Navigator.pop(context, product);
                      } catch (e) {
                        print("Error adding product: $e");
                      }
                    } else {
                      print("Form is invalid");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Add Product',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
