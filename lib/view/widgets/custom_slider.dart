import 'package:ecommerce_admin_app/controllers/controllers.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String title;
  final String name;
  final ProductController productController;
  final double controllerValue;
  const CustomSlider({
    Key? key,
    required this.title,
    required this.name,
    required this.productController,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.14,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Slider(
              value: controllerValue,
              min: 0,
              max: 100,
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
              divisions: 200,
              onChanged: (value) {
                productController.newProduct.update(
                  name,
                  (_) => value,
                  ifAbsent: (() => value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
