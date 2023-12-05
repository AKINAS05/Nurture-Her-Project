
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nurtureher/main.dart';
import 'package:nurtureher/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => false);
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/mypic.jpg'),
        //Text("NurtureHer",style: TextStyle(color: Colors.pink),),
      ),
    );
  }
}
