import 'package:flutter/material.dart';
import 'package:product_application/screens/product_list_screen.dart';
import 'package:product_application/screens/main_screen.dart';
import 'package:product_application/widgets/app_textstyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductListScreen()),
      );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: Text(
              "W E L C O M E   T O   O U R   A P P",
              style: AppTextStyle.basic,
            ),
          ),
        ],
      ),
    );
  }
}
