import 'package:flutter/material.dart';
import 'package:product_application/providers/product_provider.dart';
import 'package:product_application/screens/splash_screen.dart';
import 'package:product_application/theme/theme.dart';
import 'package:product_application/theme/theme.dart' as AppTheme;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Application',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
