
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurtureher/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:nurtureher/features/user_auth/presentation/pages/login_page.dart';
import 'package:nurtureher/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:nurtureher/features/user_auth/presentation/widgets/newform_container_widget.dart';

import '../../../../global/common/toast.dart';
import 'home_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage ({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSigningUp = false;
  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 30,
            ),
            newFormContainerWidget(
              controller: _emailController,
              hintText:"Email",
            ),
            SizedBox(
              height: 10,
            ),
            newFormContainerWidget(
              controller: _usernameController,
              hintText:"Username",
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _passwordController,
              hintText:"Password",
              isPasswordField: true,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap:() {
                _signUp();
                showToast(message:"User is successfully created");

              },
              child :Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: isSigningUp?CircularProgressIndicator(color: Colors.black,):Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),

            ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox( width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LoginPage()),(route)=> false,);
                  },
                  child: Text("Log In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    setState(() {
      isSigningUp = false;
    });
    if(user!=null){
      showToast(message:"User is successfully created");
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> HomePage()),(route)=> false,);


    }
    else{
      showToast(message: "Some error happened");
    }
  }
}
