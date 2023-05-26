import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'allproduct.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  addProduct() {
    CollectionReference products =
    FirebaseFirestore.instance.collection("products");
    products
        .add({"name": productName.text, "price": productPrice.text})
        .then((value) => print("Product Adds"))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add Products",style: TextStyle(fontSize: 50,color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productPrice,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Price',
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AllProductsView()));
            }, child: Text('All')),
            ElevatedButton(
              onPressed: () {
                addProduct();
              },
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}