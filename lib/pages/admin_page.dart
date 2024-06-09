import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';
import 'package:foody/components/widgets/dialogbox.dart';
import 'package:foody/pages/Pass_conPage.dart';

class AdminPage extends StatefulWidget {
  final String User;
  const AdminPage({super.key, required this.User});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {



    String list = "";
    String _userGroup = "";

    void addNewFood() {
    
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
        
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _userGroup = widget.User;
     // print(widget.User);
      
    });
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CafeApp",style: TextStyle(color: Colors.white),),
        actions: [IconButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> PassConpage()));

        }, icon: Icon(Icons.admin_panel_settings,size: 30,))],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: addNewFood,child: Icon(Icons.add,color: Colors.white,size: 30,),),
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
            child: list == "DRINKS"? ClientDrinks(User: _userGroup) : ClientFood(user: _userGroup,)
            ),
          )
        ],
      ),
    );
  }
}