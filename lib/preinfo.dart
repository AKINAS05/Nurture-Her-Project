import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurtureher/features/user_auth/presentation/pages/login_page.dart';
import 'package:nurtureher/preinfoContent.dart';
import 'package:flutter/src/cupertino/icons.dart';
import 'package:nurtureher/screens/signin_screen.dart';
class PreInfoPage extends StatefulWidget {
  const PreInfoPage({super.key});

  @override
  State<PreInfoPage> createState() => _PreInfoPageState();
}

class _PreInfoPageState extends State<PreInfoPage> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
   _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery1 = MediaQuery.of(context);
    return  Scaffold(
     body : Column(
       children: [
         Expanded(child: PageView.builder(
           controller: _controller,
             itemCount: contents.length,
             onPageChanged: (int index){
               setState(() {
                 currentIndex = index;
               });
             },
             itemBuilder: (_,i){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                children: [
                  Image.asset(contents[i].image,height: 500,width:500),
                  //SizedBox( height: mediaQuery1.size.height*0.008),
                  Text(contents[i].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),textAlign: TextAlign.start,),
                  SizedBox( height: mediaQuery1.size.height*0.014),
                  Text(contents[i].description,style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.start,),
                 // Text("of Tranquility"),

                ],
                ),
              );
         }
         ),
         ),
         Container(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children : List.generate(contents.length, (index) => buildDot(index, context),
             )
           ),
         ),
         Container(
           height: 60,
           margin: EdgeInsets.all(40),
           width: double.infinity,
           child: FloatingActionButton(
             child : Text(currentIndex == contents.length - 1 ? "Continue": "Next"),
             onPressed :(){
               if(currentIndex == contents.length-1 ){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {  return LoginPage();} ,));
               }
               _controller.nextPage(duration: Duration(milliseconds: 100), curve:Curves.bounceIn );
             },
             //color : Theme.of(context).primaryColor,
            // textColor :Colors.white,
             backgroundColor: Colors.pink,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
             ),
           ),
         )
       ],

     ),
    );
  }
 Container buildDot(int index,BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right:5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
      ),
    );
 }
}
