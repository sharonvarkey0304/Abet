import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/screens/sidebar/store/add_product.dart';
import 'package:loginpage/screens/sidebar/store/cart.dart';
import 'package:loginpage/screens/sidebar/store/favScreen.dart';
import 'package:loginpage/screens/sidebar/store/home2.dart';
import 'package:loginpage/screens/sidebar/store/useruploads.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var storeController = Get.put(StoreController());
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProductUploasds()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            Get.to(AddProduct.new);
          },
          backgroundColor: const Color.fromARGB(255, 255, 238, 4),
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          CupertinoIcons.home,
          CupertinoIcons.cart,
          CupertinoIcons.heart,
          CupertinoIcons.upload_circle_fill,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: const Color.fromARGB(255, 255, 238, 4),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 0,
        onTap: (index) {
          storeController.searchProduct('');
          storeController.productSearchController.clear();
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
