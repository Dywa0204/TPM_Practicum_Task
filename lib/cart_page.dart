import 'package:flutter/material.dart';
import 'data/cart_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cart List"),),
      body: Container(
        color: Color(0xDADADAFF),
        child: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (BuildContext context, int index){
            return CartList(name: cartList[index]);
          },
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final String name;
  const CartList({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(name),
          )
      )
    );
  }
}

