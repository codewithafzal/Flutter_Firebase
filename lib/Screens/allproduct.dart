import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Addproduct.dart';

class AllProductsView extends StatelessWidget {
  AllProductsView({super.key});
  CollectionReference products =
  FirebaseFirestore.instance.collection("products");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddProductView()));
            },
            child: Icon(Icons.arrow_back,size: 30)),
        title: Text('Products'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder(
              future: getAllProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,


                    ),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        for (int i=1; i<8; i++);
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => AddProductView()));
                          },

                          child:Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFCFF),
                                borderRadius: BorderRadius.circular(10,),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff50514F).withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,

                                  ),
                                ]

                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){


                                  },
                                  child: Image.asset("assets/meal$index.png",
                                    height: 150,
                                    width: 120,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data.docs[index]['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),

                                      ),
                                      SizedBox(height: 12,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                                        ,
                                        children: [
                                          Text(snapshot.data.docs[index]['price'] ,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFFB608),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Icon(
                                            Icons.favorite_border,
                                            color: Color(0xFFFFB608),
                                            size: 28,
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
// ListTile(
// title: Text(snapshot.data.docs[index]['name']),
// subtitle: Text(snapshot.data.docs[index]['price']),
// );