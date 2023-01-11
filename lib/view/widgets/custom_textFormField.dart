import 'package:flutter/material.dart';

import '../../controllers/product_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String name;
  final ProductController productController;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.name,
    required this.productController,
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: (() => value),
        );
      },
    );
  }
}
