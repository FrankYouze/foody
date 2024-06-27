import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/my_button.dart';
import 'package:foody/components/widgets/my_textfield.dart';
import 'package:foody/pages/client_page.dart';
import 'package:foody/pages/client_signup.dart';
// import 'package:foody/pages/home_page.dart';

class ClientLoginPage extends StatelessWidget {
  ClientLoginPage({super.key});

  final userEmailcon = TextEditingController();
  final passcon = TextEditingController();

 void signInUser()async{
try{
 await FirebaseAuth.instance.signInWithEmailAndPassword(
   email: userEmailcon.text,
    password: passcon.text);}catch(error){
      print(error);
    }

 }
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage(
        'assets/img/soda.jpg',
        ),
        fit: BoxFit.fitHeight,
        )
        ),
        child: Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            backgroundColor: Colors.transparent,
            title: const Text('CafeApp', 
            style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            ),
          ),
          ),
          backgroundColor: Colors.transparent,
         body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter user email",
                  obscu: false,
                  controller: userEmailcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter password",
                  obscu: true,
                  controller: passcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Signin",
                  onTap: () {
                      signInUser();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ClientPage(),
                    //   ),
                    // );
                  
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'New user?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                       //  signInUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register Here",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ), 
        ),
       );
  }
}
