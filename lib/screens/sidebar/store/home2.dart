import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';

import 'package:loginpage/screens/sidebar/store/product.dart';

class HomeScreen extends StatelessWidget {
  final List tabs = ["All", "Category", "Top", "Recommend"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: GetBuilder<StoreController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        //width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black12.withOpacity(0.05),
                        //     blurRadius: 1,
                        //     spreadRadius: 1,
                        //   )
                        // ]
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.amber.shade900,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          label: Text(
                            "",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow:  [
                        //   BoxShadow(
                        //     color: Colors.black12.withOpacity(0.05),
                        //     blurRadius: 2,
                        //     spreadRadius: 1,
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.amber.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 151, 29),
                    borderRadius: BorderRadius.circular(20),
                    //  boxShadow:  [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 1,
                    //         spreadRadius: 2,
                    //       ),
                    //     ],
                  ),
                  child: Image.asset("assets/images/image1.jpg"),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: FittedBox(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
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
                    : GridView.builder(
                        itemCount: controller.productList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          var item = controller.productList[index];
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
                                          controller.likeProduct(item: item);
                                        },
                                        onTap: () {
                                          Get.to(
                                              () => ProductScreen(item: item));
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
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.5),
                                          radius: 19,
                                          child: IconButton(
                                            onPressed: () {
                                              controller.likeProduct(
                                                  item: item);
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
                                      Positioned(
                                        right: 0,
                                        top: 50,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.5),
                                          radius: 19,
                                          child: IconButton(
                                            onPressed: () {
                                              controller.deleteProduct(
                                                  item: item);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                          ),
                                        ),
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
                        }),
              ],
            );
          }),
        )),
      ),
    );
  }
}
