import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  String list = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CafeApp"),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.white,
                    child: TextButton(onPressed: (){
                      setState(() {
                        list = "FOOD";
                      });
                    }, child: Text("FOOD",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.white,
                     child: TextButton(onPressed: (){
                      setState(() {
                        list = "DRINKS";
                      });
                     }, child: Text("DRINKS",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20))
                     )
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: list == "FOOD"? ClientFood() : ClientDrinks(),
            ),
          )
        ],
      ),
    );
  }
}
