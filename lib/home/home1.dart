import 'package:flutter/material.dart';
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/detail1');
                  },
                  child:Container(
                      height:200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/naran1.jpg",
                                height: 150,
                              ),
                            ),
                            Container(
                              height:50,
                              width: 100,
                              child: Text(
                                "Naran valley",
                                style: TextStyle(fontSize:10),
                              ),
                            ),
                          ]
                      )
                  ),
                ),
                SizedBox(
                  height: 50,

                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/kaghanvalley');
                  },
                  child:Container(
                      height:200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/kaghanh.jpg",
                                height: 150,
                              ),
                            ),
                            Container(
                              height:50,
                              width: 100,
                              child: Text(
                                "Kaghan Valley",
                                style: TextStyle(fontSize:10),
                              ),
                            ),
                          ]
                      )
                  ),
                ),]),
        ),
        SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/shogranvalley');
                  },
                  child:Container(
                      height:200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/shogranh.jpg",
                                height: 150,
                              ),
                            ),
                            Container(
                              height:50,
                              width: 100,
                              child: Text(
                                "Shogran Valley",
                                style: TextStyle(fontSize:10),
                              ),
                            ),
                          ]
                      )
                  ),
                ),
                SizedBox(
                  height: 50,

                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/balakotvalley');
                  },
                  child:Container(
                      height:200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/bridge balakot.jpg",
                                height: 150,
                              ),
                            ),
                            Container(
                              height:50,
                              width: 100,
                              child: Text(
                                "Balakot Valley",
                                style: TextStyle(fontSize:10),
                              ),
                            ),
                          ]
                      )
                  ),
                ),]),
        )
    ])))));
  }
}
