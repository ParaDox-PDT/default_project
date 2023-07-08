import 'package:flutter/material.dart';
import 'package:n8_default_project/local/service/hive_service.dart';
import 'package:n8_default_project/models/app_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Cart Screen"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              ...List.generate(HiveService.cartsBox.length, (index){
                AppModel app = HiveService.cartsBox.getAt(index);
                return ListTile(title: Text(app.title),);
              })
            ],
          ))
        ],
      ),
    );
  }
}
