import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screens/screens.dart';
import 'view/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce Admin',
      theme: theme(),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/products',
          page: (() => ProductScreen()),
        ),
      ],
    );
  }
}
