import 'package:get/get.dart';

import '../models/models.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  void updateProductPrice(
      {required int index, required Product product, required double value}) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
      {required int index, required Product product, required int value}) {
    product.quantity = value;
    products[index] = product;
  }
}
