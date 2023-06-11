import 'package:flutter/material.dart';
import 'package:himalayas_spots/balakotscreen/apbalakot.dart';
import 'package:himalayas_spots/balakotscreen/balakotfuel.dart';
import 'package:himalayas_spots/balakotscreen/balakothotel.dart';
import 'package:himalayas_spots/balakotscreen/bankbalakot.dart';
import 'package:himalayas_spots/balakotscreen/hospitalsbalakot.dart';

class Balakotscreen extends StatefulWidget {
  const Balakotscreen({Key? key}) : super(key: key);

  @override
  State<Balakotscreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Balakotscreen> {
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xff132613),
      body: Container(
        height: s.height,
        width: s.height,
        child: Column(
          children: [
            Container(
              height: 500,
              width: s.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/bridge balakot.jpg"),
                  fit: BoxFit.fill,
                ),
                //color: Color(0xffe0a8a8),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Color(0xffa8a879),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    /// attraction points
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Apbalakot()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff263a26)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.attractions, size: 90, color: Color(
                                0xffadda96),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Attraction points", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /// hotels
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> Balakothotel()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff263a26)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home_outlined, size: 90, color: Color(
                                0xffadda96),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Hotels", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /// fuel station
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkShopBalkot()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff263a26)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.local_gas_station_rounded, size: 90,
                              color: Color(
                                  0xffadda96),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Fuel Stations", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /// Banks and Atms
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> BankAndAtmBalakot()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff263a26)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home_work_outlined, size: 90, color: Color(
                                0xffadda96),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Banks and Atm", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /// Hospitals
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalsBalakot()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff263a26)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.local_hospital, size: 90, color: Color(
                                0xffc54545),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Hospitals", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }}
