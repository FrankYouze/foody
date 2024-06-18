import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final DatabaseReference orderdListDB =
      FirebaseDatabase.instance.ref().child("OrderList");
  Map<dynamic, dynamic> OrderList = {};

  @override
  void initState() {
    // TODO: implement initState

    orderdListDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        OrderList = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        print(OrderList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("NO ORDERS YET"),
      ),
    );
  }
}
