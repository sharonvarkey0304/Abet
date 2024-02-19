import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/widgets/snackbar.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _storeController = Get.find<StoreController>();
  GlobalKey<FormState> productFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 330,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/add.png',
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 25, left: 25),
                child: Text(
                  ' SELL YOUR PRODUCT',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: productFormKey,
                  child: GetBuilder<StoreController>(builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, right: 25, left: 25),
                          child: TextFormField(
                            controller: _storeController.productNameController,
                            validator: _storeController.commonValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Product name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            controller:
                                _storeController.productDetailsController,
                            validator: _storeController.commonValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: 'Details',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, right: 25, left: 25),
                          child: TextFormField(
                            controller: _storeController.productPriceController,
                            validator: _storeController.commonValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, right: 25, left: 25),
                          child: TextFormField(
                            controller:
                                _storeController.productContactNumController,
                            validator: _storeController.commonValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Contact number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, right: 25, left: 25),
                          child: TextFormField(
                            controller: _storeController.productEmailController,
                            validator: _storeController.commonValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Stack(
                            children: [
                              //image container
                              SizedBox(
                                height: 190,
                                width: 170,
                                child: controller.image != null
                                    ? Image.file(
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        File(controller.image ?? ''),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          'assets/images/nophoto.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),

                              //image add icon
                              Positioned(
                                top: 140,
                                left: 120,
                                child: IconButton(
                                  onPressed: controller.pickImage,
                                  icon: const Icon(
                                    FontAwesomeIcons.cameraRetro,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await _storeController
                                .addProductBtnOntap(productFormKey);
                          },
                          child: controller.addProductStatus ==
                                  AddProductStatus.loading
                              ? CommonWidget.loadingIndicator()
                              : const Text('Submit'),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
