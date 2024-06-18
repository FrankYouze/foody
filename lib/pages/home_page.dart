import 'package:flutter/material.dart';
import 'package:foody/pages/auth_page.dart';
import 'package:foody/pages/client_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "CafeApp",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: 
      
        SafeArea(
          child: Container(
            height: double.infinity,
            child: Column(
              children: [
        
        
        Text("CAFERERIA ORDERING APP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                                  width: double.infinity,
                                  height: height * 0.25,
                                   child: ClipRRect(
                                     borderRadius:  BorderRadius.circular(20),
                                
                                     child: Image(
                                      image: AssetImage("assets/pilau.jpg"),
                                      fit: BoxFit.cover,
                                     ),
                                   ),
                                  
                                ),
                      ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: height * 0.25,
                                   child: ClipRRect(
                                     borderRadius:  BorderRadius.circular(20),
                                
                                     child: Image(
                                      image: AssetImage("assets/OIP.jpeg"),
                                      fit: BoxFit.cover,
                                     ),
                                   ),
                                  
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: height * 0.25,
                                   child: ClipRRect(
                                     borderRadius:  BorderRadius.circular(20),
                                
                                     child: Image(
                                      image: AssetImage("assets/wali.jpg"),
                                      fit: BoxFit.cover,
                                     ),
                                   ),
                                  
                                ),
                              ),
                                                 Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: height * 0.25,
                                   child: ClipRRect(
                                     borderRadius:  BorderRadius.circular(20),
                                
                                     child: Image(
                                      image: AssetImage("assets/zege.jpeg"),
                                      fit: BoxFit.cover,
                                     ),
                                   ),
                                  
                                ),
                              )
                    
                    ],),
                  ),
                ),
                width <= 500? 
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientPage()));
                    },
                    child: Container(
                      height: 80,
                      width: 230,
                      child: Center(child: Text("Client",style: TextStyle(color: Colors.white,fontSize: 28)))))
                // SizedBox(
                //   height: 20,
                // ),
                :
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AuthPage()));
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      child: Center(child: Text("Admin",style: TextStyle(color: Colors.white,fontSize: 20),)))),
              ],
            ),
          ),
        ),
     
    );
  }
}
