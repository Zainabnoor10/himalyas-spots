import 'package:flutter/material.dart';
import 'package:himalayas_spots/home/pak_home.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      // appBar:AppBar(
      //   title: Text("HOME"),
      //
      // ),
      body: /*Container(
      height: s.height,
    width: s.width,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/backaground.jpeg'),
    fit: BoxFit.fill,
    ),
    ),child: Center(
        child: Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffff0000),
          ),
          child: Center(
            child: Text("It's Time for A new adventure",style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),),
          ),
        ),
      ),
      )*/
      InkWell(
        onTap: (){
          //Navigator.pushNamed(context, '/pak_home');
          Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreenPak()));

        },
        child: Container(
          height: s.height
          ,
          width: s.width,
          child: Image.asset("assets/adventurehome.jpeg",fit: BoxFit.fill),
        ),
      ),
      //  Column(
      //   children: [
      //
      //     //const SizedBox(
      //      // height: 15,
      //    // ),
      //     //TetButton(onPressed: (){
      //      // Navigator.pushNamed(context, "/home1");
      //    // },)
      //   ],
      //
      // ),
    );
  }
}
