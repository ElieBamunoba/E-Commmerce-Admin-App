import 'package:get/get.dart';

import '../models/models.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

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
