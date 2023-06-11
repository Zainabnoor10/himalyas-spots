import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AdminFirst extends StatefulWidget {
  const AdminFirst({Key? key}) : super(key: key);

  @override
  State<AdminFirst> createState() => _AdminFirstState();
}

class _AdminFirstState extends State<AdminFirst> {

  final TextEditingController _postController = TextEditingController();
  final TextEditingController _PostdetailController = TextEditingController();



  FirebaseAuth auth = FirebaseAuth.instance;


  Postdetails() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    Map<String, dynamic> userdata = {
      'id': user!.uid,
      'posttitle': _postController.text,
      'postdetail': _PostdetailController.text,

    };

    await firebaseFirestore.collection("admin").add(userdata);

    Fluttertoast.showToast(msg: "POSTED  successfully :) ");
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,),
                    Text("DASHBOARD",style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff88cb48),
                      fontWeight: FontWeight.bold,
                    ),),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/seepost');

                    },
                        child: Text("All posts",style: TextStyle(
                          color:Color(0xff88cb48),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:Color(0xff88cb48),
                      width: 3,
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 70,
                      width: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xff88cb48),
                            width: 3,
                          )
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: _postController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.post_add,size: 20,color: Colors.black,),
                            hintText: "Post Title",
                            border: InputBorder.none,
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 300,
                      width: 320,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xff88cb48),
                            width: 3,
                          )
                      ),
                      child: TextFormField(
                        controller: _PostdetailController,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.post_add),
                          hintText: "Post Detail",
                          border: InputBorder.none,
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(onTap: () async {
                      await Postdetails();

                      _PostdetailController.clear();
                      _postController.clear();

                    },
                      child: Container(
                        height: 70,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xff88cb48),
                              width: 3,
                            )
                        ),
                        child: Center(
                          child: Text("ADD POST",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff88cb48),
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}