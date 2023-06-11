import 'package:flutter/material.dart';

class BankAndAtmKaghan extends StatefulWidget {
  const BankAndAtmKaghan({Key? key}) : super(key: key);

  @override
  State<BankAndAtmKaghan> createState() => _BankAndAtmKaghanState();
}

class _BankAndAtmKaghanState extends State<BankAndAtmKaghan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdef3de),
      appBar: AppBar(
        backgroundColor: Color(0xff0a640a),
        title: Text("Banks And ATMs"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFFFFF),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 190,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("assets/bank.jpeg"),
                              fit: BoxFit.fill,
                            )
                        ),
                        // color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text("HBL Kaghan",style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                              Icon(Icons.location_on,size: 20,color: Colors.green,),
                              SizedBox(
                                width: 20,
                              ),
                           //   Text("Bypass Road Naran \n Mansehra road KPK",style: TextStyle(
                             //   fontWeight: FontWeight.w400,
                               // fontSize: 15,
                                //color: Colors.black,
                              //),),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_clock,size: 20,color: Colors.green,),
                              SizedBox(
                                width: 20,
                              ),
                              Text("(Mon to Fri) \n 9:00 am to 4:00 pm",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black,
                              ),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text("Directions",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,

                              ),),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFFFFF),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 190,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("assets/atm.jpeg"),
                              fit: BoxFit.fill,
                            )
                        ),
                        // color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text("NBP Bank And ATM",style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                              Icon(Icons.location_on,size: 20,color: Colors.green,),
                              SizedBox(
                                width: 20,
                              ),
                              //Text("Bypass Road Naran \n Mansehra road KPK",style: TextStyle(
                                //fontWeight: FontWeight.w400,
                                //fontSize: 15,
                                //color: Colors.black,
                              //),),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_clock,size: 20,color: Colors.green,),
                              SizedBox(
                                width: 20,
                              ),
                              Text("(Mon to Fri) \n 9:00 am to 4:00 pm",style: TextStyle(

                              fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black,
                              ),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text("Directions",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,

                              ),),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),

),
);
}
}