
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/pages/admin_page.dart';
import 'package:foody/pages/client_page.dart';
import 'package:foody/pages/login_page.dart';
import 'package:foody/pages/login_page1.dart';



class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: StreamBuilder<User?> (
stream: FirebaseAuth.instance.authStateChanges(),
builder: (context,snapshot){

if(snapshot.hasData){

  return ClientPage();
}else{

  return ClientLoginPage();
}

},

 ),


    );
  }
}