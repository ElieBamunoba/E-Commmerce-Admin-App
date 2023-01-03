import 'package:ecommerce_admin_app/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My eCommerce',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => ProductScreen());
              },
              child: Card(
                  child: Center(
                child: Text(
                  'Go to Products',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
