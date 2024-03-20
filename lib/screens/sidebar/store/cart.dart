import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<StoreController>(
        builder: (controller) {
          List<ProductDataList> cartProducts =
              controller.filteredProductList.where((e) => e.isCart).toList();
          if (cartProducts.isEmpty) {
            return Center(child: Text('No Cart products to show'));
          }
          return ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              var item = cartProducts[index];
              return ListTile(
                leading: IconButton(
                  onPressed: () {
                    controller.cartProduct(item: item);
                  },
                  icon: Icon(
                    item.isFavourite
                        ? EvaIcons.shoppingCart
                        : EvaIcons.shoppingCartOutline,
                    color: item.isCart ? Colors.yellow : Colors.black,
                  ),
                ),
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Books",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                  ),
                ),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.image[0],
                    height: 80,
                    width: 80,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
