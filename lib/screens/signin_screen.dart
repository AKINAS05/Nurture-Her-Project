import 'package:flutter/material.dart';
class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery1 = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQuery1.size.width,
        height: mediaQuery1.size.height,
        child : Column(
          children: [
            // Image.asset('assets/images/trial.webp'),
            SizedBox( height: mediaQuery1.size.height*0.07),
            Container(
              width: mediaQuery1.size.width,
              //height : 500,
              child : Image.asset('assets/images/loginpic.png'),
            ),
            SizedBox( height: mediaQuery1.size.height*0.002),
            Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 30,fontStyle: FontStyle.normal),),
            SizedBox( height: mediaQuery1.size.height*0.002),
            Text("Super Women",style: TextStyle(fontWeight: FontWeight.bold,fontSize:38),),
            SizedBox( height: mediaQuery1.size.height*0.002),
            Text("Sign in to access your account" ,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),),
           // Text("blues and Menopause issues.",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton : Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              extendedSizeConstraints: BoxConstraints.tightFor(height: 50,width: 370),
            )
        ),

        child: Column(
          children:[
            SizedBox( height: mediaQuery1.size.height*0.62),
            FloatingActionButton.extended(
              // icon: Icon(Icons.account_circle),
              label : Text('Enter Your Email',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              foregroundColor: Colors.black,
              onPressed: null,
              backgroundColor: Colors.white54,
              icon: Icon(Icons.mail),
            ),
            SizedBox( height: mediaQuery1.size.height*0.028),
            FloatingActionButton.extended(
              label: Text('Password',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
              onPressed: (){
              },
              backgroundColor: Colors.white54,
              foregroundColor: Colors.black,
              icon: Icon(Icons.lock),
            ),
            SizedBox( height: mediaQuery1.size.height*0.12),
            FloatingActionButton.extended(
              label: Text('Log in',style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: null,
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),

    );
  }
}
