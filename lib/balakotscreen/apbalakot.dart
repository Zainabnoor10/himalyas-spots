import 'package:flutter/material.dart';
import 'package:himalayas_spots/pakhome/kaghanscreen.dart';




class Apbalakot extends StatelessWidget {
  List<ApBalakot> apbalakot =[
    ApBalakot(imageUrl:'assets/lalazarlake kap.jpg', description:"Lalazar Family Park", ),
    ApBalakot(imageUrl:'assets/waterfall naran.jpg', description:"Kunnar River", ),
    ApBalakot(imageUrl:'assets/hill top balakot.jpg', description:"Balakot hills Top", ),
    ApBalakot(imageUrl:'assets/bridge balakot.jpg', description:"Balakot Bridge", ),
    ApBalakot(imageUrl:'assets/river park balakot ap.jpg', description:"River Park Balakot", ),
    ApBalakot(imageUrl:'assets/tarppi bridge kap.jpg', description:"Hassa Bridge view", ),
    ApBalakot(imageUrl:'assets/kawai balakotap.jpg', description:"Kawai point", ),
    ApBalakot(imageUrl:'assets/balakot along ap.jpg', description:"Along Balakot", ),
    ApBalakot(imageUrl:'assets/babusartop naran.jpg', description:"Cool Breeze Point", ),
    ApBalakot(imageUrl:'assets/kunhar river balakot.jpg', description:"Kunar River Balakot", ),

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
          itemCount: apbalakot.length,
          itemBuilder: (context,index){
            ApBalakot item =apbalakot[index];

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

class ApBalakot {

  String imageUrl;
  String description;

  ApBalakot({
    required this.imageUrl,
    required this.description,
  });

}