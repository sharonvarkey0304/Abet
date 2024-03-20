//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';

import 'package:loginpage/screens/sidebar/store/product.dart';

class ProductUploasds extends StatefulWidget {
  @override
  State<ProductUploasds> createState() => _ProductUploadsState();
}

class _ProductUploadsState extends State<ProductUploasds> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Uploads"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: GetBuilder<StoreController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                SizedBox(
                  height: 10,
                ),
                
                SizedBox(height: 15),
                /*  SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: controller.productList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = controller.productList[index];
                      return Container(
                        // height: 150,
                        // width: 150,
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 180,
                              width: 150,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ProductScreen(item: item));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: /* Image.file(
                                        File(item.image ?? ''),
                                        fit: BoxFit.cover,
                                        height: 180,
                                        width: 150,
                                      ), */
                                          Image(
                                        image: MemoryImage(
                                          const Base64Decoder()
                                              .convert(item.image[0]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.updateImageFavouriteStatus(
                                            index: index,
                                          );
                                        },
                                        child: Center(
                                          child: Icon(
                                            item.isFavourite
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_outline_outlined,
                                            color: item.isFavourite
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 22,
                                ),
                                Text(
                                  '(829)',
                                ),
                                SizedBox(width: 10),
                                Text(
                                  item.price,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20), */
                controller.productList.isEmpty
                    ? Text('No products to show')
                    : controller.filteredProductList.isEmpty
                        ? Text('No results found')
                        : GridView.builder(
                            itemCount: controller.filteredProductList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 2,
                            ),
                            itemBuilder: (context, index) {
                              var item = controller.filteredProductList[index];
                              //new line starting
                              return Container(
                                // height: 150,
                                // width: 150,
                                margin: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onDoubleTap: () {
                                              controller.likeProduct(
                                                  item: item);
                                            },
                                            onTap: () {
                                              Get.to(() =>
                                                  ProductScreen(item: item));
                                            },
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: /* Image.file(
                                        File(item.image ?? ''),
                                        fit: BoxFit.cover,
                                        height: 180,
                                        width: 150,
                                      ), */
                                                    Image.network(
                                                  height: 180,
                                                  width: 150,
                                                  item.image[0],
                                                )),
                                          ),
                                          Stack(
                                            children: [
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.5),
                                                  radius: 19,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      controller.deleteProduct(
                                                          item: item);
                                                    },
                                                    icon: Icon(
                                                      item.isFavourite
                                                          ? Icons.delete
                                                          : Icons
                                                              .delete,
                                                    ),
                                                    color: item.isFavourite
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                         
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                   
                                  ],
                                ),
                              );
                            }),
              ],
            );
          }),
        )),
      ),
   );
  }
//   void showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Center(child: Text('Logout')),
//           content: Text('Do you want to log out?'),
//           actions: [
//             TextButton(
//               onPressed: () {
               
               
//               },
//               child: Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//   }
 }