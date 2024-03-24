import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/controler/profile_ctr.dart';
import 'package:loginpage/screens/sidebar/store/widget/container_button.dart';

class ProductDetails extends StatelessWidget {
  final String sellername;
  final String email;
  final String phoneNumber;
  final String price;
  final controller = Get.put(ProfileController());
  ProductDetails({
    required this.sellername,
    required this.email,
    required this.phoneNumber,
    required this.price,
  });

  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  // Usermodel? userData = controller.userData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
<<<<<<< HEAD
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name:",
                              style: iStyle,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "E-mail:",
                              style: iStyle,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Ph No:",
                              style: iStyle,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(userData!.name, style: iStyle),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(email, style: iStyle),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(phoneNumber, style: iStyle),
                              ],
                            ),
                          ],
                        ),
                      ],
=======
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name:",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "E-mail:",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Ph No:",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(sellername, style: iStyle),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(email, style: iStyle),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(phoneNumber, style: iStyle),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: iStyle),
                      Text(
                        "$price",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    child: ContainerButton(
                      containerWidth: MediaQuery.of(context).size.width,
                      itext: "Contact",
                      bgcolor: Colors.amber,
>>>>>>> 4f47f0bdb631fdfd37e50564c2675378fb708594
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payment", style: iStyle),
                        Text(
                          "$price",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: ContainerButton(
                        containerWidth: MediaQuery.of(context).size.width,
                        itext: "Contact",
                        bgcolor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: ContainerButton(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Buy Now",
        bgcolor: Colors.amber,
      ),
    );
  }
}
