import 'package:flutter/material.dart';

class ProductUploads extends StatefulWidget {
  const ProductUploads({super.key});

  @override
  State<ProductUploads> createState() => _ProductUploadsState();
}

class _ProductUploadsState extends State<ProductUploads> {
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
      body: ListView(
        children: [
          // SizedBox(
          //   height: 330,
          //   width: MediaQuery.of(context).size.width,
          //   child: Image.asset(
          //     'assets/images/upload.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Align(
          //     alignment: Alignment.center,
          //     child: Padding(
          //         padding: EdgeInsets.only(left: 9),
          //         child: Text(
          //           "Recent Uploads",
          //           style: GoogleFonts.poppins(fontSize: 30),
          //         ))),
          // SizedBox(height: 30),
          _buildUploadItem(),
        ],
      ),
    );
  }

  Widget _buildUploadItem() {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/book1.jpg',
                    fit: BoxFit.cover,
                    height: 180,
                    width: 150,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    radius: 19,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
