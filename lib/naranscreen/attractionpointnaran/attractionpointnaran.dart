import 'package:flutter/material.dart';
import 'package:himalayas_spots/pakhome/naranscreen.dart';

import 'apnaranclass.dart';


class Attractionpointnaran extends StatelessWidget {
  List<Attractionpoints> attractionpoints =[
  Attractionpoints(imageUrl:'assets/naran bazar.jpg', description:"Naran Bazar", ),
  Attractionpoints(imageUrl:'assets/waterfall naran.jpg', description:"Water fall Naran", ),
  Attractionpoints(imageUrl:'assets/nooritop naran.jpg', description:"Noori Top", ),
  Attractionpoints(imageUrl:'assets/babusartop naran.jpg', description:"Babusar Top", ),
    Attractionpoints(imageUrl:'assets/lullusar lake nap.jpg', description:"lulusar lake", ),
    Attractionpoints(imageUrl:'assets/ansulake nap.jpg', description:"Ansu lake", ),
    Attractionpoints(imageUrl:'assets/batakundi nap.jpg', description:"Batakundi Naran", ),
    Attractionpoints(imageUrl:'assets/burawainaran.jpg', description:"Burawai Naran", ),
    Attractionpoints(imageUrl:'assets/dudipatsar nap.jpg', description:"Dudipatsar Lake", ),
    Attractionpoints(imageUrl:'assets/gittidas nap.jpg', description:"Gittidas Meadows", ),
    Attractionpoints(imageUrl:'assets/jalkand nap.jpg', description:"Jalkand Naran", ),
    Attractionpoints(imageUrl:'assets/lalazarlake nap.jpg', description:"Lalazar Lake", ),
    Attractionpoints(imageUrl:'assets/malikaparbat nap.jpg', description:"Malika Parbat", ),
    Attractionpoints(imageUrl:'assets/saifulmaluk nap.jpg', description:"Saiful Maluk Lake", ),
    Attractionpoints(imageUrl:'assets/tiger peak nap.jpg', description:"Tiger Peak ", ),
    Attractionpoints(imageUrl:'assets/treepark nap.jpg', description:"Tree Park", ),
    Attractionpoints(imageUrl:'assets/besal point nap.jpg', description:"Besal Point", ),
    Attractionpoints(imageUrl:'assets/aytzazlake nap.jpg', description:"Aytzaz Lake", ),
    Attractionpoints(imageUrl:'assets/mulla ki basti nap.jpg', description:"Mulla Ki Basti", ),
    Attractionpoints(imageUrl:'assets/cave point nap.jpg', description:"Mysterious Cave Point", ),
    Attractionpoints(imageUrl:'assets/zipline nap.jpg', description:"Naran Zipline", ),
    Attractionpoints(imageUrl:'assets/pyalalake nap.jpg', description:"Pyala Lake", ),
    Attractionpoints(imageUrl:'assets/imagerattigali.jpg', description:"Ratti Gali Lake", ),
    Attractionpoints(imageUrl:'assets/national park nap.jpg', description:"National Park Naran", ),
    Attractionpoints(imageUrl:'assets/sambaksar lake nap.jpg', description:"Sambaksar Lake", ),
    Attractionpoints(imageUrl:'assets/saral gali nap.jpg', description:"Saral Gali", ),
    Attractionpoints(imageUrl:'assets/saral pass nap.jpg', description:"Saral Pass", ),

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
          itemCount: attractionpoints.length,
      itemBuilder: (context,index){
            Attractionpoints item =attractionpoints[index];

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