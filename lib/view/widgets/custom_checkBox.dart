import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final String name;
  final ProductController productController;
  final bool controllerValue;
  const CustomCheckBox({
    Key? key,
    required this.title,
    required this.name,
    required this.productController,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(title),
        ),
        Checkbox(
          value: controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: (() => value),
            );
          },
        ),
      ],
    );
  }
}
