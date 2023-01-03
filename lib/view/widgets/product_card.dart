import 'package:ecommerce_admin_app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final ProductController productController = Get.find();
  ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14,
                            child: Text(
                              'Price',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.48,
                            child: Slider(
                              value: product.price,
                              min: 0,
                              max: 100,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black12,
                              divisions: 200,
                              onChanged: (value) {
                                productController.updateProductPrice(
                                  index: index,
                                  product: product,
                                  value: value,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              '\$${product.price.toStringAsFixed(1)}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14,
                            child: Text(
                              'Quantity',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.48,
                            child: Slider(
                              value: product.quantity.toDouble(),
                              min: 0,
                              max: 100,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black12,
                              divisions: 100,
                              onChanged: (value) {
                                productController.updateProductQuantity(
                                  index: index,
                                  product: product,
                                  value: value.toInt(),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              '${product.quantity}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
