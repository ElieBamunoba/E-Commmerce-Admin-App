import 'package:ecommerce_admin_app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/widgets.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    child: InkWell(
                      onTap: () async {
                        ImagePicker _picker = ImagePicker();
                        final XFile? _mage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (_mage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No image was selected')));
                        }
                        if (_mage != null) {}
                      },
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
                              'Add an Image',
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
                const SizedBox(height: 20),
                Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline4,
                ),
                CustomTextFormField(
                  hintText: 'Product ID',
                  name: 'id',
                  productController: productController,
                ),
                CustomTextFormField(
                  hintText: 'Product Name',
                  name: 'name',
                  productController: productController,
                ),
                CustomTextFormField(
                  hintText: 'Product Description',
                  name: 'description',
                  productController: productController,
                ),
                CustomTextFormField(
                  hintText: 'Product Category',
                  name: 'category',
                  productController: productController,
                ),
                const SizedBox(height: 20),
                CustomSlider(
                  title: 'Price',
                  name: 'price',
                  productController: productController,
                  controllerValue: productController.price ?? 0,
                ),
                CustomSlider(
                  title: 'Quantity',
                  name: 'quantity',
                  productController: productController,
                  controllerValue: productController.quantity ?? 0,
                ),
                const SizedBox(height: 20),
                CustomCheckBox(
                  title: 'Recommended',
                  name: 'isRecommended',
                  productController: productController,
                  controllerValue: productController.isRecommended ?? false,
                ),
                CustomCheckBox(
                  title: 'Popular',
                  name: 'isPopular',
                  productController: productController,
                  controllerValue: productController.isPopular ?? false,
                ),
                Center(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      print(productController.newProduct);
                    },
                    child: Text(
                      'Save',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
