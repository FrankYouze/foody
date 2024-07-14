import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/admin_dashboard.dart';
import 'package:foody/models/AdminAuth.dart';
import 'package:foody/pages/admin_page.dart';
import 'package:foody/pages/auth_page.dart';
import 'package:provider/provider.dart';

class AdminLoginPage extends StatelessWidget {
   AdminLoginPage({super.key});

  final emailcon = TextEditingController();
  final passCon = TextEditingController();

  void signInUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcon.text, password: passCon.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
          body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
             children :[ 
              Container(
                width :double.infinity,
                height: 1000,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/soda.jpg"),
                    fit: BoxFit.cover,)
              )),
              Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 254, 255), fontSize: 30,fontWeight:  FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller:emailcon,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(),
                        hintText: "Enter manager Email",
                        fillColor: Colors.white,
                        filled: true
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passCon,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(),
                        hintText: "Enter password",
                        fillColor: Colors.white,
                        filled: true
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {



                final email = emailcon.text;
                final Password = passCon.text;
                 context.read<AdminAuth>().login(email, Password);
final auth = context.read<AdminAuth>().isAuthenticated;



if(auth) {

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminDashboard()));}

                          else{
                                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Wrong password,Please try again!')),
                  );
                          }
                    },
                    color: Colors.grey[900],
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),]
          ),
        ),
      ),
    );
  }
}
