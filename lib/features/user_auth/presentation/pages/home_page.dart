import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../global/common/toast.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NurtureHer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child: Text("Welcome to HomePage"),

        ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LoginPage()),(route)=> false,);
              showToast(message: "Successfully signed out");
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
             child: Center(child: Text("Sign Out",style: TextStyle(color: Colors.white),),),
            ),
          )
    ],
      ),
    );
  }
}
