import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backaground.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 400,
                child: Image.asset('assets/loginlogo.jpg')),


              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff1d481d),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                     Navigator.pushNamed(context, '/loginf');
                  },
                  child: Center(
                      child: Text(
                        'LOG IN AS ADMIN',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            color: Colors.white,
                            fontSize: 20,
                          fontWeight: FontWeight.w600,

                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff1d481d),
                  //Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Center(
                      child: Text(
                        'LOG IN AS USER',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            color: Colors.white,
                            fontSize: 20),

                      )),

                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
