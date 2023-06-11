import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Homenew extends StatefulWidget {
  Homenew({
    Key? key,
  }) : super(key: key);

  @override
  State<Homenew> createState() => _HomeState();
}

class _HomeState extends State<Homenew> {


  FirebaseAuth auth = FirebaseAuth.instance;


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  var name;
  var number;

  @override
  Widget build(BuildContext context) {
    String uid = auth.currentUser!.uid;
    print('uid ${uid.toString()}');

    return Scaffold(
      appBar: AppBar(),

      drawer: Drawer(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userData = snapshot.data!.data();
              if (userData != null) {
                return Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text('User profile'),
                    Text('NAME: ${userData['name']}'),
                    Text('EMAIL: ${userData['email']}'),
                    Text('PHONE: ${userData['phone']}'),
                    Text('ADDRESS: ${userData['address']}'),
                    Text('PASSWORD: ${userData['password']}'),
                  ],
                );
              }
            }
            return Center(
              child: SpinKitWave(
                color: Colors.black, // Set the desired color
                size: 150, // Set the desired size
              ),
            );
            // CircularProgressIndicator(color: Colors.black,backgroundColor: Colors.green,);
          },
        ),
      ),
      //data of current  user

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Text(
                'HOME',
                style: TextStyle(fontSize: 50),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: 300,
                child: Column(
                  children: [

                    //Create Data
                    ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Users')
                            .doc(auth.currentUser!.uid)
                            .set({
                          'email': auth.currentUser!.email,
                          'password': auth.currentUser!.email,
                          'name': auth.currentUser!.email,
                          'address': auth.currentUser!.email,
                          'phone': auth.currentUser!.email,
                        }, SetOptions(merge: true)).then((_) {
                          print('Data created or updated successfully!');
                        }).catchError((error) {
                          print('Error creating or updating data: $error');
                        });
                      },
                      child: Text('Create Data'),
                    ),

                    //  Read Data
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(auth.currentUser!.uid)
                            .get()
                            .then((DocumentSnapshot<Map<String, dynamic>>
                        snapshot) {
                          if (snapshot.exists) {
                            Map<String, dynamic> userData = snapshot.data()!;
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(

                                title: const Text('USer Data'),
                                content: Container(
                                  height: 200,
                                  // width: 500,
                                  child: Column(
                                    children: [
                                      Center(child: Text('Name: ${userData['name']}')),
                                      Center(child: Text('Email: ${userData['email']}')),
                                      Center(child: Text('Phone: ${userData['phone']}')),
                                      Center(child: Text('Address: ${userData['address']}')),
                                      Center(child: Text('Password: ${userData['password']}',style: TextStyle(fontSize: 15),))
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );

                            print('User Data:');
                            print('Name: ${userData['name']}');
                            print('Email: ${userData['email']}');
                            print('Phone: ${userData['phone']}');
                            print('Address: ${userData['address']}');
                            print('Password: ${userData['password']}');
                          } else {
                            print('User data does not exist!');
                          }
                        }).catchError((error) {
                          print('Error retrieving user data: $error');
                        });
                      },
                      child: Text('Get Data'),
                    ),

                    //  Update data
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(auth.currentUser!.uid)
                            .update({
                          'name': 'Updated Name',
                          'phone': 'Updated Phone',
                          'address': 'Updated Address',
                        }).then((value) {
                          print('UPdate data');
                        });
                      },
                      child: Text('Update Data'),
                    ),

                    // delete data
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(auth.currentUser!.uid)
                            .delete()
                            .then((value) {
                          print('All DATA DELETED');
                        });
                      },
                      child: Text('Delete all Data'),
                    ),


                    //delete specific data
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(auth.currentUser!.uid)
                            .update({
                          'phone': FieldValue.delete(),
                        }).then((value) {
                          print('PHONE NUMBER DELETED');
                        });
                      },
                      child: Text('Delete Phone Field'),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Update NAme'),
                  ),
                  ElevatedButton(

                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(auth.currentUser!.uid)
                          .update({
                        'name': _nameController.text,
                      }).then((value) {
                        print('PRINT ${_nameController.text}');
                      });
                      _nameController.clear();
                    },


                    child: Text('Update NAme'),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(hintText: 'Update Number'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(auth.currentUser!.uid)
                          .update({
                        'phone': _phoneController.text,
                      }).then((value) {
                        print('PRINT ${_phoneController.text}');
                      });
                      _phoneController.clear();
                    },
                    child: Text('Update Phone'),
                  ),
                  ElevatedButton(onPressed: ()async {
                    var token ="";
                   await FirebaseMessaging.instance.getToken().then((value) {
                      print("token is $value");
                      token = value!;
                    });
                  },
                  child:Text(""),
        ),

                  TextButton(
                    onPressed: () => Navigator.pushNamed(context,'/firebaseoperation'),
                    child: Text('OK',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
