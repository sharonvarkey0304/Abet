import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/contribution_model.dart';

class ContentDetailsPage extends StatelessWidget {
  const ContentDetailsPage({super.key, required this.item});
  final Subject item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(item.title ?? "No name"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.5),
              child: Image.network(
                item.imageBase64 ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text("No image"));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              item.title ?? "No Title",
              style: context.textTheme.bodyMedium?.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              item.details ?? "No Title",
              style: context.textTheme.bodyMedium?.copyWith(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
