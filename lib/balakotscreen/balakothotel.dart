import 'package:flutter/material.dart';

import 'package:himalayas_spots/pakhome/naranscreen.dart';




class Balakothotel extends StatelessWidget {
  List<Balakothotel1> hotels = [

    Balakothotel1 (heading:"Garlot Balakot", description: ' Hotel and Restaurant'),
    Balakothotel1 (heading:"Azan Hotel", description: "Main bazar Balakot,Hotel and Restaurant",),
    Balakothotel1 (heading: "Al_Quresh Hotel", description: "Main Bazar Balakot,Hotel and Restaurant"),
    Balakothotel1 (heading: "Balakot Hotel", description: "Main Bazar Balakot Naran Rd,Hotel and Restaurant"),
    Balakothotel1 (heading: "Hotel Rehmat Park", description: " Naran Rd,Restaurant"),
    Balakothotel1 (heading: "Ever Green Hotel", description: "Main Bazar Balakot,Hotel and Restaurant"),
    Balakothotel1 (heading: "Rosevale Hotel", description: "Main Bazar Balakot ,Naran Rd,Hotel"),
    Balakothotel1 (heading: "Blue bell", description: "Tarrana Balakot,Hotel and Restaurant"),
    Balakothotel1 (heading: "Cordillera Resort", description: "Tarrana Balakot,Hotel and Restaurant"),

    
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
            Balakothotel1 item =hotels[index];

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
class Balakothotel1 {
  String heading;
  String description;

  Balakothotel1({
    required this.heading,
    required this.description,
  });

}