import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/product_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

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
      body: GetBuilder<StoreController>(
        builder: (controller) {
          List<ProductDataList> favouriteProducts =
              controller.filteredProductList.where((e) => e.isFavourite).toList();
          return favouriteProducts.isEmpty
              ? Center(child: Text('No favourite products to show'))
              : ListView.builder(
                  itemCount: favouriteProducts.length,
                  itemBuilder: (context, index) {
                    var item = favouriteProducts[index];
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          controller.likeProduct(item: item);
                        },
                        icon: Icon(
                          item.isFavourite ? Icons.favorite : Icons.favorite_outline_outlined,
                          color: item.isFavourite ? Colors.red : Colors.black,
                        ),
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "Books",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.image[0],
                          height: 80,
                          width: 80,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
