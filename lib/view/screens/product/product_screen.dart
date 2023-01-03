import 'package:ecommerce_admin_app/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Products',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => Get.to(() => const NewProductScreen()),
                child: Card(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add a New Product',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: ((context, index) {
                return Obx(
                  () => SizedBox(
                    height: 210,
                    child: ProductCard(
                      product: productController.products[index],
                      index: index,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
