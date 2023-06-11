import 'package:flutter/material.dart';
class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                child: Image.asset("assets/naran1.jpg",fit: BoxFit.cover,),
                height: 200,
                width: 300,
              ),
    SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
    child: Column(
    children: [
    SizedBox(
    height: 50,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    InkWell(
    onTap: (){
    Navigator.pushNamed(context, '/naranvalley');
    },
    child:Container(
    height:200,
    width: 200,
    child: Column(
    children: [
    Container(
    height: 150,
    width: 150,
    child: Image.asset(
    "assets/naran1.jpg",
    height: 150,
    ),
    ),
    Container(
    height:50,
    width: 100,
    child: Text(
    "Naran valley",
    style: TextStyle(fontSize:10),
    ),
    ),
    ]
    )
    ),
    ),
    SizedBox(
    height: 50,

    ),
    InkWell(
    onTap: (){
    Navigator.pushNamed(context, '/kaghanvalley');
    },
    child:Container(
    height:200,
    width: 200,
    child: Column(
    children: [
    Container(
    height: 150,
    width: 150,
    child: Image.asset(
    "assets/kaghanh.jpg",
    height: 150,
    ),
    ),
    Container(
    height:50,
    width: 100,
    child: Text(
    "Kaghan Valley",
    style: TextStyle(fontSize:10),
    ),
    ),
    ]
    )
    ),
    ),]),
    SizedBox(
    height: 50,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    InkWell(
    onTap: (){
    Navigator.pushNamed(context, '/shogranvalley');
    },
    child:Container(
    height:200,
    width: 200,
    child: Column(
    children: [
    Container(
    height: 150,
    width: 150,
    child: Image.asset(
    "assets/shogranh.jpg",
    height: 150,
    ),
    ),
    Container(
    height:50,
    width: 100,
    child: Text(
    "Shogran Valley",
    style: TextStyle(fontSize:10),
    ),
    ),
    ]
    )
    ),
    ),
    SizedBox(
    height: 50,

    ),
    InkWell(
    onTap: (){
    Navigator.pushNamed(context, '/balakotvalley');
    },
    child:Container(
    height:200,
    width: 200,
    child: Column(
    children: [
    Container(
    height: 150,
    width: 150,
    child: Image.asset(
    "assets/bridge balakot.jpg",
    height: 150,
    ),
    ),
    Container(
    height:50,
    width: 100,
    child: Text(
    "Balakot Valley",
    style: TextStyle(fontSize:10),
    ),
    ),
    ]
    )
    ),
    ),])
    ])))
          ],

        ),
      ),
    );
  }
}
