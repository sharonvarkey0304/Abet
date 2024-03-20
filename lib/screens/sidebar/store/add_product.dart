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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: Get.back,
                  icon: Icon(Icons.arrow_back),
                ),
              ),
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
              Form(
                key: productFormKey,
                child: GetBuilder<StoreController>(builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                        child: TextFormField(
                          controller: _storeController.productNameController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: 'Product name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                        child: TextFormField(
                          controller:
                              _storeController.productsellerNameController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: 'Seller name',
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
                          controller: _storeController.productDetailsController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                        child: TextFormField(
                          controller: _storeController.productPriceController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                        child: TextFormField(
                          controller:
                              _storeController.productContactNumController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                        child: TextFormField(
                          controller: _storeController.productEmailController,
                          validator: _storeController.commonValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            controller.imageLoading
                                ? SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CommonWidget.loadingIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 190,
                                    width: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: controller.images.isNotEmpty
                                          ? Image.network(
                                              controller.images[0],
                                            )
                                          : Image.asset(
                                              height: 100,
                                              width: 100,
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
                      SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }
}
