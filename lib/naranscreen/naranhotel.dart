import 'package:flutter/material.dart';

import 'package:himalayas_spots/pakhome/naranscreen.dart';

import 'naranhotelclass.dart';


class HotelScreen extends StatelessWidget {
  List<Hotels> hotels = [

    Hotels (heading:"Dream World Hotel", description: 'Rajwal ,Naran ,Hotel'),
    Hotels (heading:"Heart land Hotel", description: "Naran Road,Hotel",),
    Hotels (heading: "Gateway Hotel", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "Hotel One Naran", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "New Park Hotel", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "New White Palace", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "Hotel Emeralad", description: "Main Bazar Naran,Hotel"),
    Hotels (heading: "Karachi Restaurant", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "Moon Restaurant", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "Prime Roze", description: "Main Bazar Naran,Hotel and Restaurant"),
    Hotels (heading: "Anwar_ul_Madina ", description: "Main Bazar Naran,Hotel and Restaurant"),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdef3de),

      appBar: AppBar(

        title: Text("Hotels and Restaurant"),

        centerTitle: true,
        backgroundColor: Color(0xff0a640a) ,
      ),
      body: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context,index){
            Hotels item =hotels[index];

            return

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 135,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.heading,style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.description,size: 20,color: Colors.green,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(item.description,style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone_missed,size: 20,color: Colors.green,),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("03465130451",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              );

              /*Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox
                    (height: 8.0,),
                  Text(item.heading,style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8.0,),
                  Text(item.description,style: TextStyle(fontSize: 20.0),
                  )],
              ),
            )*/

          }),
    );
  }
}