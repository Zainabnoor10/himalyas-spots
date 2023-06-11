import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../balakotscreen/balakotscreen.dart';
class HomeScreenPak extends StatefulWidget {
  const HomeScreenPak({Key? key}) : super(key: key);

  @override
  State<HomeScreenPak> createState() => _HomeScreenPakState();
}

class _HomeScreenPakState extends State<HomeScreenPak> {
  FirebaseAuth auth = FirebaseAuth.instance;
  File? _imageFile;
  String _uploadedImageUrl='';

// Function to pick an image from gallery
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery,imageQuality:40);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        _uploadImage();
      });
    }
  }

// Function to upload profile image to storage and save image URL to Firestore
  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    try {
      // Step 1: Upload the image to Firebase Storage
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref().child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(_imageFile!);
      final snapshot = await uploadTask.whenComplete(() {});

      // Step 2: Get the uploaded image's URL
      if (snapshot.state == TaskState.success) {
        final downloadUrl = await storageRef.getDownloadURL();

        // Step 3: Save the image URL to Firestore
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final userCollectionRef = FirebaseFirestore.instance.collection('Users');
          final currentUserDocRef = userCollectionRef.doc(user.uid);

          await currentUserDocRef.update({
            'imageurl': downloadUrl,
          });

          setState(() {
            _uploadedImageUrl = downloadUrl;
          });

          print("Image URL saved to Firestore");
        }
      }
    } catch (error) {
      print("Error uploading image: $error");
    }
  }

  String imageUrl='';

  @override
  void initState() {
    super.initState();
    loadProfileImage();
  }

  Future<void> loadProfileImage() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userCollectionRef = FirebaseFirestore.instance.collection('Users');
        final currentUserDocRef = userCollectionRef.doc(user.uid);

        final docSnapshot = await currentUserDocRef.get();
        if (docSnapshot.exists) {
          setState(() {
            imageUrl = docSnapshot.get('imageurl');
          });
        }
      }
    } catch (error) {
      print('Error loading profile image: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff71b4b4),
      drawer: Drawer(

        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  ---------------------steam new ----------------------//
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("Users")
                              .doc(auth.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              final userData = snapshot.data!.data();
                              if (userData != null && userData is Map<String, dynamic>) {
                                final imageUrl = userData.containsKey('imageurl')
                                    ? userData['imageurl'] as String
                                    : '';
                                return Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        child: ClipOval(
                                          child: imageUrl.isNotEmpty
                                              ? Image.network(imageUrl)
                                              : Padding(
                                            padding: const EdgeInsets.all(100.0),
                                            child: Text(
                                              'Image not found',
                                              style: TextStyle(fontSize: 50),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:50,
                                width:130,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.brown,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  onTap: _pickImage,
                                  child: Center(child: Text('Upload Image')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        final userData = snapshot.data!.data();
                        if (userData != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                    width: 374,
                                    height:50,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 5,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text('MY Profile',style: TextStyle(fontWeight: FontWeight.bold),))
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 374,
                                    height:30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text('NAME: ${userData['name']}',style: TextStyle(fontWeight: FontWeight.bold),))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 374,
                                    height:30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text('EMAIL: ${userData['email']}',style: TextStyle(fontWeight: FontWeight.bold),))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 374,
                                    height:30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),child: Center(child: Text('PHONE: ${userData['phone']}',style: TextStyle(fontWeight: FontWeight.bold),))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 374,
                                    height:30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text('ADDRESS: ${userData['address']}',style: TextStyle(fontWeight: FontWeight.bold),))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: 374,
                                    height:30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.brown,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text('PASSWORD: ${userData['password']}',style: TextStyle(fontWeight: FontWeight.bold),))),
                              ],
                            ),
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// Naran tour
                  InkWell(
                    onTap:(){
                //      Navigator.push(context, MaterialPageRoute(builder: (context) => Naranscreen()));
        Navigator.pushNamed(context, '/naranscreen');
        },
                    child: Container(
                      height: 330,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/naran1.jpg"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Naran Valley",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("on earth there is no",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("heaven,but there are ",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("pieces of it ",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),)

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  /// kaghanh
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/kaghanscreen');
                    },
                    child: Container(
                      height: 330,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/kaghannn.jpg"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Kaghan Valley",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Nature never did",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("betray the heart that",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("loved her ",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),)

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// shogranh
                  InkWell(
                    onTap :(){
            Navigator.pushNamed(context, '/shogranscreen');

            },
                    child: Container(
                      height: 330,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/shogranh.jpg"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Shogran",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("To walk in nature is",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("to witness a thousand ",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("miracles ",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),)

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                 ///       balakot
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/balakotscreen');
                    },
                    child: Container(
                      height: 330,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/bridge balakot.jpg"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Balakot",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Nature's artistry whispers",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("serenity in every breath",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),),
                          Text("of existence",style: TextStyle(
                            //fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Color(0xff2f2e2e),
                          ),
                          ),
                          // ElevatedButton(
                          // onPressed: () {
                          //   Navigator.pushNamed(context, '/naranscreen');
                          // },
                          // child:Text("Next"),
                          // ), ],
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
