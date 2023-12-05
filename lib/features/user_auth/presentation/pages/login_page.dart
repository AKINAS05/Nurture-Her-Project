import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nurtureher/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:nurtureher/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:nurtureher/features/user_auth/presentation/widgets/newform_container_widget.dart';

import '../../../../global/common/toast.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';
import 'home_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSigning = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery1 = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image.asset('assets/images/loginpic.png'),
        SizedBox( height: mediaQuery1.size.height*0.002),
        Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 30,fontStyle: FontStyle.normal),),
        SizedBox( height: mediaQuery1.size.height*0.002),
        Text("Super Women",style: TextStyle(fontWeight: FontWeight.bold,fontSize:38),),
              SizedBox(
                height: 30,
              ),
              newFormContainerWidget(
                controller: _emailController,
                hintText: "Email",
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _signIn();
                  showToast(message: "User is successfully signed In");
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: _isSigning ? CircularProgressIndicator(
                        color: Colors.white,) : Text("Log In",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),)),

                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  _signInWithGoogle();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google, color: Colors.white,),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Sign in with Google",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),),
                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Text("Sign Up", style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      showToast(message: "User is successfully signed In");
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => HomePage()), (
          route) => false,);
    }
    else {
      showToast(message: "Some error happened");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
   

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => HomePage()), (
            route) => false,);
      }
    } catch (e) {
          showToast(message: "some error occured $e");
    }
  }
}


