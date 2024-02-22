import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/product_model.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GetBuilder<StoreController>(builder: (controller) {
            List<ProductDataList> favouriteProducts = controller.productList
                .where(
                  (e) => e.isFavourite,
                )
                .toList();
            return Column(
              children: [
                favouriteProducts.isEmpty
                    ? Center(child: Text('No favourite products to show'))
                    : ListView.builder(
                        itemCount: favouriteProducts.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = favouriteProducts[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            controller.likeProduct(item: item);
                                          },
                                          icon: Icon(
                                            item.isFavourite
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_outline_outlined,
                                          ),
                                          color: item.isFavourite
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Checkbox(
                                //   splashRadius: 20,
                                //   activeColor: Color.fromARGB(255, 255, 238, 4),
                                //   value: true,
                                //   onChanged: (val){}
                                //   ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.image[0],
                                      height: 80,
                                      width: 80,
                                    )),
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
                                    SizedBox(height: 10),
                                    Text(
                                      "Books",
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 16,
                                      ),
                                    ),
                                    // SizedBox(height: 10),
                                    // Text(prices[index],
                                    // style: TextStyle(
                                    //   fontSize: 16,
                                    //   fontWeight: FontWeight.w900,
                                    // ),
                                    // ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Icon(CupertinoIcons.minus,
                                //     color: Colors.green,
                                //     ),
                                //     SizedBox(width: 20),
                                //     Text("1",
                                //     style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w700,
                                //     ),
                                //     ),
                                //     SizedBox(width: 5),
                                //     Icon(CupertinoIcons.plus,
                                //     color: Colors.red,
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          );
                        }),

                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Select All",
                //      style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //     ),
                //     Checkbox(
                //     splashRadius: 20,
                //     activeColor: Color.fromARGB(255, 255, 238, 4),
                //     value: false,
                //     onChanged: (val){}
                //     ),
                //   ],
                // ),
                // Divider(height: 20, thickness: 2,color: Colors.black,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Total Payment",
                //      style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w700,
                //                 ),
                //     ),
                //     Text("Rs 489",
                //      style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w900,
                //                 ),
                //     )
                //   ],
                // ),
                //  SizedBox(height: 20),
                //   InkWell(
                //     onTap: () {

                //     },
                //     child: ContainerButton(
                //       containerWidth: MediaQuery.of(context).size.width,
                //       itext: "Contact",
                //       bgcolor: Colors.amber,
                //     ),
                //   ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
