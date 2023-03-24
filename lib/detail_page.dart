import 'package:flutter/material.dart';
import 'package:praktpm_kuis/cart_page.dart';
import 'data/groceries.dart';
import 'data/cart_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatelessWidget {
  final Groceries groceries;

  const DetailPage({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item Detail'),
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Image.network(
                groceries.productImageUrls[0],
                fit: BoxFit.fitWidth,
                height: 200,
              ),
              SizedBox(height: 8.0),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groceries.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          groceries.storeName,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "Rp " + groceries.price,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Rp " + groceries.description,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 16.0),
                    Text("Discount : " + groceries.discount),
                    SizedBox(height: 8.0),
                    Text("Rate : " + groceries.reviewAverage),
                    SizedBox(height: 8.0),
                    Text("Stock : " + groceries.stock + " item"),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () {
                    //final SharedPreferences prefs = await SharedPreferences.getInstance();
                    // List<String> cart = prefs.getStringList("cart") ?? <String>[];
                    // cart.add(groceries.name);
                    // prefs.setStringList("cart", cart);
                    cartList.add(groceries.name);

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CartPage();
                    }));
                  },
                  child: Text("Add Item to Cart")
              )
            ],
          ),
        ),
    );
  }
}
