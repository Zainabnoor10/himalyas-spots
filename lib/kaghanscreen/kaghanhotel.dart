import 'package:flutter/material.dart';

import 'package:himalayas_spots/pakhome/naranscreen.dart';




class Kaghanhotel extends StatelessWidget {
  List<Kaghanhotel1> hotels = [

    Kaghanhotel1 (heading:"Ahsania Hotel and Restaurant", description: 'Kaghan Rd ,Malakandi ,Hotel and Restaurant'),
    Kaghanhotel1 (heading:"Baddar Hotel and Restaurant", description: "Naran Rd,Hotel and Restaurant",),
    Kaghanhotel1 (heading: "Awais Chapal Kabab", description: "Naran Rd,Mahandri,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Royal Hotel and Restaurant", description: "Naran Rd,Mahandri,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Green Valley Hotel", description: "Naran Rd,Mahandri,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "GB Moon Hotel", description: "Naran Rd,khanian,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Heaven Rose Hotel ", description: "Naran Rd,Khanian,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Pine Park Hotel", description: "Naran Rd,Kaghan,Hotel"),
    Kaghanhotel1 (heading: "Hotel Dr.Jan Muhammad", description: "Naran Rd,Kaghan,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Punjab Restaurant Kaghan", description: "Main Bazar Kaghan,Hotel and Restaurant"),
    Kaghanhotel1 (heading: "Usmania hotel ", description: "Main Bazar Kaghan,Hotel and Restaurant"),

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
            Kaghanhotel1 item =hotels[index];

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



          }),
    );
  }
}
class Kaghanhotel1 {
  String heading;
  String description;

  Kaghanhotel1({
    required this.heading,
    required this.description,
  });

}