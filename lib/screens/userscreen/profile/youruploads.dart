import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Uploads extends StatefulWidget {
  const Uploads({super.key});

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 330,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/upload.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Text(
                    "Recent Uploads",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ))),
          SizedBox(height: 30),
          _buildUploadItem(
              fileName: 'Software Engineering', directory: 'semester 1/html'),
          SizedBox(height: 20),
          _buildUploadItem(
              fileName: 'Software Engineering', directory: 'semester 5/java'),
        ],
      ),
    );
  }
}

Widget _buildUploadItem({required String fileName, required String directory}) {
  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(
          Icons.insert_drive_file,
          color: Colors.red,
          size: 32, // Adjust the size as needed
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fileName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              directory,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(), // Adds space to push the next icon to the end
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.delete,
            color: Colors.red, // Set the color as needed
            size: 24, // Adjust the size as needed
          ),
        ),
      ],
    ),
  );
}
