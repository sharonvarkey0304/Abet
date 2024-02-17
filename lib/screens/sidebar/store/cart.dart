import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/sidebar/store/widget/container_button.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  List imagesList = [
    "assets/images/book1.jpg",
    "assets/images/book2.jpg",
    "assets/images/book3.jpg",
    "assets/images/book4.jpg",
  ];

  List productTitles = [
    "Maths",
    "RDBMS",
    "Java",
    "Python",
  ];

  List prices = [
    "Rs100",
    "Rs200",
    "Rs150",
    "Rs180",
  ];

  CartScreen({super.key});

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
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    itemCount: imagesList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                splashRadius: 20,
                                activeColor: Color.fromARGB(255, 255, 238, 4),
                                value: true,
                                onChanged: (val) {}),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imagesList[index],
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productTitles[index],
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
                                SizedBox(height: 10),
                                Text(
                                  prices[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.red,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Checkbox(
                      splashRadius: 20,
                      activeColor: Color.fromARGB(255, 255, 238, 4),
                      value: false,
                      onChanged: (val) {}),
                ],
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Rs 489",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
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
    );
  }
}
