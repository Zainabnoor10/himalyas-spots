import 'package:flutter/material.dart';
import 'package:himalayas_spots/pakhome/kaghanscreen.dart';




class ApShogran extends StatelessWidget {
  List<ApShogran1> apshogran =[
    ApShogran1(imageUrl:'assets/pine-park-shogranap.jpg', description:"Pine Park Shogran", ),
    ApShogran1(imageUrl:'assets/siripaye shogranap.jpg', description:"Siri Paye Track", ),
    ApShogran1(imageUrl:'assets/mannameadows shogranap.jpg', description:"Manna Meadows", ),
    ApShogran1(imageUrl:'assets/Shogran top ap.jpg', description:"Shogran Top", ),
    ApShogran1(imageUrl:'assets/Archadian shogranap.jpg', description:"Archadian Park", ),
    ApShogran1(imageUrl:'assets/Hilltop shogranap.jpg', description:"Hill Top Shogran", ),
    ApShogran1(imageUrl:'assets/kawai village shogran ap.jpg', description:"Kawai Village", ),
    ApShogran1(imageUrl:'assets/Makra-Choti shogranap.jpg', description:"Makra Choti(Spider Peak)", ),
    ApShogran1(imageUrl:'assets/paye Meadows shogran ap.jpg', description:"Paye Meadows", ),
    ApShogran1(imageUrl:'assets/Shankri huts shogranap.jpg', description:"Shankri Huts Shogran", ),
    ApShogran1(imageUrl:'assets/siripaye shogranap.jpg', description:"Siri Pye", ),
    ApShogran1(imageUrl:'assets/Paras bazar shogranap.jpg', description:"Paras Bazar", ),
    ApShogran1(imageUrl:'assets/jared village shogran ap.jpg', description:"Jared Village", ),
    ApShogran1(imageUrl:'assets/Kanshian forest shogranap.jpg', description:"Kanshian Forest", ),
    ApShogran1(imageUrl:'assets/Shogran.jpg', description:"Shogran Ground", ),

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
          itemCount: apshogran.length,
          itemBuilder: (context,index){
            ApShogran1 item =apshogran[index];

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

class ApShogran1 {

  String imageUrl;
  String description;

  ApShogran1({
    required this.imageUrl,
    required this.description,
  });

}