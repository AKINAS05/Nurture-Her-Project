import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nurtureher/preinfo.dart';

import 'features/app/flash_screen/splash_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home :const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    var mediaQuery1 = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home :Scaffold(
        body : Container(
          width: mediaQuery1.size.width,
          height: mediaQuery1.size.height,
          child : Column(
            children: [
             // Image.asset('assets/images/trial.webp'),
              SizedBox( height: mediaQuery1.size.height*0.15),
              Container(
                width: mediaQuery1.size.width,
               //height : 500,
               child : Image.asset('assets/images/mypic.jpg'),
              ),
              SizedBox( height: mediaQuery1.size.height*0.008),
              Text("Welcome to NurtureHer", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,fontStyle: FontStyle.normal),),
              SizedBox( height: mediaQuery1.size.height*0.008),
              Text("Your one stop solution for",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),),
              Text("period pains,PCOS,Postpartum" ,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),),
              Text("blues and Menopause issues.",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton : Theme(
          data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              extendedSizeConstraints: BoxConstraints.tightFor(height: 50,width: 370),
            )
          ),

          child: Column(
            children:[
              SizedBox( height: mediaQuery1.size.height*0.7),
              FloatingActionButton.extended(
               // icon: Icon(Icons.account_circle),
                label : Text('Continue with Google',style: TextStyle(fontWeight: FontWeight.bold)),
                foregroundColor: Colors.black,
                onPressed: null,
                backgroundColor: Colors.white,
              ),
              SizedBox( height: mediaQuery1.size.height*0.008),
              FloatingActionButton.extended(
                label: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {  return PreInfoPage();} ,));
                },
                backgroundColor: Colors.pink,
              ),
              SizedBox( height: mediaQuery1.size.height*0.008),
              FloatingActionButton.extended(
                label: Text('I already have an Account',style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: null,
                backgroundColor: Colors.white54,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ),



      ),
    );

  }
}
