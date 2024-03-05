// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loginpage/screens/sidebar/store/widget/container_button.dart';

// // ignore: must_be_immutable
// class CartScreen extends StatelessWidget {
//   List imagesList = [
//     //"assets/images/book1.jpg",
//     //"assets/images/book2.jpg",
//     "assets/images/book3.jpg",
//     //"assets/images/book4.jpg",
//   ];

//   List productTitles = [
//     //"Maths",
//     //"RDBMS",
//     "Java",
//     //"Python",
//   ];

//   List prices = [
//     //"Rs100",
//     //"Rs200",
//     "Rs150",
//     //"Rs180",
//   ];

//   CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         leading: BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             children: [
//               ListView.builder(
//                   itemCount: imagesList.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Checkbox(
//                               splashRadius: 20,
//                               activeColor: Color.fromARGB(255, 255, 238, 4),
//                               value: true,
//                               onChanged: (val) {}),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               imagesList[index],
//                               height: 80,
//                               width: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 productTitles[index],
//                                 style: TextStyle(
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 "Books",
//                                 style: TextStyle(
//                                   color: Colors.black26,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 prices[index],
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: const [
//                               Icon(
//                                 CupertinoIcons.minus,
//                                 color: Colors.green,
//                               ),
//                               SizedBox(width: 20),
//                               Text(
//                                 "1",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               SizedBox(width: 5),
//                               Icon(
//                                 CupertinoIcons.plus,
//                                 color: Colors.red,
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   }),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Select All",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Checkbox(
//                       splashRadius: 20,
//                       activeColor: Color.fromARGB(255, 255, 238, 4),
//                       value: false,
//                       onChanged: (val) {}),
//                 ],
//               ),
//               Divider(
//                 height: 20,
//                 thickness: 2,
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text(
//                     "Total Payment",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "Rs 150",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 20),
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//           backgroundColor: Colors.transparent,
//           context: context,
//           builder: (context) => Container(
//             height: MediaQuery.of(context).size.height / 2.5,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Name:",

//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             "E-mail:",

//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             "Ph No:",

//                           ),
//                           SizedBox(height: 20),
//                         ],
//                       ),
//                       SizedBox(width: 30),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Text("sharon", ),
//                             ],
//                           ),
//                           SizedBox(height: 15),
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Text("sharon@gmail.com", ),
//                             ],
//                           ),
//                           SizedBox(height: 20),
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Text("+91983671825", ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: const [
//                   //     Text("Total Payment", ),
//                   //     Text(
//                   //       "Rs 200",
//                   //       style: TextStyle(
//                   //           fontSize: 18,
//                   //           fontWeight: FontWeight.bold,
//                   //           color: Colors.black45),
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(height: 10),
//                   InkWell(
//                     child: ContainerButton(
//                       containerWidth: MediaQuery.of(context).size.width,
//                       itext: "Buy Now",
//                       bgcolor: Colors.amber,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//                 },
//                 child: ContainerButton(
//                   containerWidth: MediaQuery.of(context).size.width,
//                   itext: "Contact",
//                   bgcolor: Colors.amber,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/product_model.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GetBuilder<StoreController>(builder: (controller) {
            List<ProductDataList> cartProducts = controller.filteredProductList
                .where(
                  (e) => e.isCart,
                )
                .toList();
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
