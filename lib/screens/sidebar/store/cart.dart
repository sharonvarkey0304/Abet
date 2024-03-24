import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/product_model.dart';

class CartScreen extends StatelessWidget {
<<<<<<< HEAD
  const CartScreen({Key? key});
=======
  const CartScreen({Key? key}) : super(key: key);
>>>>>>> ab24d01119a730448c2044080d8d89741d4a96ad

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
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GetBuilder<StoreController>(builder: (controller) {
            List<ProductDataList> cartProducts = controller.filteredProductList
                .where(
                  (e) => e.isCart,
                )
                .toList();

            // Calculate total price
            double totalPrice = 0;
            for (var product in cartProducts) {
              totalPrice += double.parse(product.price);
            }

            return Column(
              children: [
                cartProducts.isEmpty
                    ? Center(child: Text('No Cart products to show'))
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = cartProducts[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        controller.cartProduct(item: item);
                                      },
                                      icon: Icon(item.isFavourite
                                          ? EvaIcons.shoppingCart
                                          : EvaIcons.shoppingCartOutline),
                                      color: item.isCart
                                          ? Colors.yellow
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 10), // Added SizedBox for spacing
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    item.image[0],
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                SizedBox(
                                    width: 10), // Added SizedBox for spacing
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "\RS ${item.price}",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Books",
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Add your functionality here
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Total Price: \RS ${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
=======
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
>>>>>>> ab24d01119a730448c2044080d8d89741d4a96ad
      ),
    );
  }
}
