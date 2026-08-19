import 'package:flutter/material.dart';
import 'package:product_application/screens/product_list_screen.dart';
import 'package:product_application/screens/product_detail.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [ProductListScreen(), ProductDetailScreen(product: null)];
  List titles = ['Home Page', 'Product Detail'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home Page'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Product Page',
          ),
        ],
      ),
    );
  }
}
