import 'package:flutter/material.dart';
import 'package:himalayas_spots/pakhome/kaghanscreen.dart';

import 'apnkaghanclass.dart';


class Apkaghann extends StatelessWidget {
  List<Apkaghan1> apkaghan =[
    Apkaghan1(imageUrl:'assets/mahandri kap.JPG', description:"Mahandri Kaghan", ),
    Apkaghan1(imageUrl:'assets/kamal ban kp.jpg', description:"Kamal ban Kaghan", ),
    Apkaghan1(imageUrl:'assets/danna meadows.jpg', description:"Danna Meadows", ),
    Apkaghan1(imageUrl:'assets/hussaini-bridge kap.jpg', description:"Hanging Bridge Prehena", ),
    Apkaghan1(imageUrl:'assets/lohar banda kap.jpg', description:"Lohar Banda Kaghan", ),
    Apkaghan1(imageUrl:'assets/rajwal tentvillage kap.jpg', description:"Rajwal Tent Village", ),
    Apkaghan1(imageUrl:'assets/sehkundi meadows.jpg', description:"Sehkundi Meadows", ),
    Apkaghan1(imageUrl:'assets/tarppi bridge kap.jpg', description:"Tarppi Bridge Kaghan", ),
    Apkaghan1(imageUrl:'assets/water fall kaghan kap.jpg', description:"Water Fall Kaghan", ),
    Apkaghan1(imageUrl:'assets/khanian kap.jpg', description:"Khanian", ),
    Apkaghan1(imageUrl:'assets/behari village kap.jpg', description:"Behari Village", ),
    Apkaghan1(imageUrl:'assets/chambra peak kap.jpg', description:"Chambra Peak", ),
    Apkaghan1(imageUrl:'assets/DS ground kap.jpg', description:"DS Ground", ),
    Apkaghan1(imageUrl:'assets/manshi top kap.jpg', description:"Manshi Top ", ),
    Apkaghan1(imageUrl:'assets/sharan forest kap.jpg', description:"Sharn Forest", ),
    Apkaghan1(imageUrl:'assets/shingri point kap.jpg', description:"Shingri Point", ),
    Apkaghan1(imageUrl:'assets/sukkaban valley kap.png', description:"Sukkaban Valley", ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffc0d7d7),
      appBar: AppBar(
        title: Text("Attraction Points"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemCount: apkaghan.length,
          itemBuilder: (context,index){
            Apkaghan1 item =apkaghan[index];

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox
                    (height: 8.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        height: 200,
                        width: 320,
                        child: Image.asset(item.imageUrl,fit: BoxFit.fill,)
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      width: 320,
                      child: Text(item.description,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lobster',
                      ),
                      ),
                    ),
                  )],
              ),
            );
          }),
    );
  }
}

class Apkaghan1 {

  String imageUrl;
  String description;

  Apkaghan1({
  required this.imageUrl,
  required this.description,
  });

}