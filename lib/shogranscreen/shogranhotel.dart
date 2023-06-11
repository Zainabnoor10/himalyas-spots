import 'package:flutter/material.dart';

import 'package:himalayas_spots/pakhome/naranscreen.dart';




class Shogranhotel extends StatelessWidget {
  List<Shogranhotel1> hotels = [

    Shogranhotel1 (heading:"Lalazar Abshar View", description: 'Kiwai ,Katha ,Shogran,Hotel and Restaurant'),
    Shogranhotel1 (heading:"Faisal Hotel", description: "Kiwai ,Katha ,Shogran,Hotel and Restaurant",),
    Shogranhotel1 (heading: "Bissillah Chapal", description: "Kiwai Shogran,Hotel"),
    Shogranhotel1 (heading: "Sky Restaurant", description: "Naran Rd,Shogran, Restaurant"),
    Shogranhotel1 (heading: "Manshee Breeze Hotel", description: "Shogran Top,Chinees Restaurant"),
    Shogranhotel1 (heading: "Khaber Continental", description: "Shogran Top,Restaurant"),
    Shogranhotel1 (heading: "Royal Palace Hotel", description: "Shogran Top,Hotel and Restaurant"),
    Shogranhotel1 (heading: "Pine Park Galade", description: "Shogran Top,Luxury Top"),
    Shogranhotel1 (heading: "Tourist INN Hotel", description: "Shogran Top,Hotel and Restaurant"),

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
            Shogranhotel1 item =hotels[index];

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
class Shogranhotel1 {
  String heading;
  String description;

  Shogranhotel1({
    required this.heading,
    required this.description,
  });

}