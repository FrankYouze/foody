import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/orderItem.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final DatabaseReference orderdListDB =
      FirebaseDatabase.instance.ref().child("OrderList");
  Map<dynamic, dynamic> OrderList = {};
  //List <dynamic> Items = [];


  @override
  void initState() {
    // TODO: implement initState

    orderdListDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        OrderList = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        print("${OrderList.keys} keys");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("TRRRX"),
            Container(
              child: OrderList.length == 0 ? Center(child: Text("NO ORDERS YET")): ListView.builder(
                shrinkWrap: true,
                itemCount: OrderList.length,
                itemBuilder: (context,ind){
              dynamic current = OrderList.keys.elementAt(ind);
              //print(OrderList[current]["Orders"]);
              String Items = OrderList[current]["Orders"];
              String JsonItems = Items
                  .replaceAllMapped(RegExp(r'(\w+):'), (match) {
              if (match[1] == 'https') {
                return match[0] ?? '';  // Do not replace 'https:'
              } else {
                return '"${match[1]}":';
              }
                    })
                    .replaceAll(RegExp(r':\s*(https)'), ': "https')
                    .replaceAll(RegExp(r'([a-f0-9]{4,})(\s*})'), r'\1"}')
                    .replaceAll(RegExp(r'\s+'), ' ');
              
              
                   
              List<dynamic> orders = jsonDecode(JsonItems);
              
               print(" start ${orders.length} end");
                return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text("Location"),Text(OrderList[current]["Location"])],
                                            
                              ),
                            ),
                             Container(
                              height: 200,
                               child: ListView.builder(
                                shrinkWrap: true,
                              //  physics: NeverScrollableScrollPhysics(),
                                itemCount: orders.length,
                                itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(orders[index]['image']),
                          title: Text('Name: ${orders[index]['name']}'),
                          trailing: Text('Name: ${orders[index]['price']}'),
                          ),
                      );
                                },
                          ),
                             ),
                      ],),
                    )
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
