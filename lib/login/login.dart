import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:himalayas_spots/constants/my_textfield.dart';
import '../home/Homenew.dart';
import '../home/home.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //vareables to git all the data of current user want to log in
//   String userEmail = '';
//   String userPassword = '';
//   String username = '';
//   String useraddress = '';
//   String userphone = '';
//
//   // funtion to check if user exist in firestore
//   Future login(String email, String password) async {
// //with this query i check if the email user entered is equal to the email stored in firestore
//     QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .limit(1)
//         .get();
//     //if it exist then get all the data stored in my firestore
//     //getting data with the help of key 'email'
//     if (snapshot.docs.isNotEmpty) {
//       Map<String, dynamic> userData = snapshot.docs.first.data();
//       userEmail = userData['email'];
//       userPassword = userData['password'];
//       username = userData['name'];
//       useraddress = userData['address'];
//       userphone = userData['phone'];
//
//       String savedemail = userData['email'];
//       //for checking password if its equal to the password in firestore the go to the next page
//       String savedPassword = userData['password'];
//
//       if (savedPassword == password) {
//         //go to next page and get all the data of current user
//         // Navigate to the next page
//         // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(userEmail: userEmail, userPassword: userPassword, username: username, useraddress: useraddress, userphone: userphone,) ));
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Homenew()));
//       } else {
//         // Show error: Invalid password
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Invalid  password.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } else {
//       // Show error: Invalid email
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('Invalid email.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
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
            child: Column(children: [
              SizedBox(
                height: 66,
              ),
              Container(
                height: 200,
                width: 300,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/loginlogo.jpg",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 65,
                  width: 374,
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 235, 235, 1.0),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    // minLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      print(value);
                    },

                    validator: (value) {
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value!)) {
                        return "please enter a Valid email";
                      } else {
                        return null;
                      }
                    },

                    decoration: InputDecoration(
                      label: Text("abc@gmail.com"),
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Color(
                                  0xff0a640a) ,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            color: Color(
                                0xff0a640a) , // Set the color of the line here
                          ),
                        ],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 20,
              ),
              // MyTextField(hinttext: "Enter your password", prefixicon: Icons.lock_outlined),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 65,
                  width: 374,
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 235, 235, 1.0),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    // minLines: 1,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else if (value!.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },

                    obscureText: true,

                    decoration: InputDecoration(
                      label: Text("12345"
                          ""),
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.password,
                              color: Color(
                                  0xff0a640a) ,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            color: Color(
                                0xff0a640a) , // Set the color of the line here
                          ),
                        ],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 85),

              Container(

                height: 50,
                width: 290,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(
                        0xff0a640a) ),
                child: MaterialButton(

                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();


                           try{

                             await FirebaseAuth.instance
                                 .signInWithEmailAndPassword(
                                 email: _emailController.text.trim(),
                                 password: _passwordController.text.trim());
                             Fluttertoast.showToast(msg: "Login Successfully",gravity: ToastGravity.CENTER);


                             Navigator.push(context, MaterialPageRoute(
                               builder: (context) => HomeScreen(),));


                           }catch(ex){
                              Fluttertoast.showToast(msg: ex.toString(),gravity: ToastGravity.CENTER);
                             //log(ex.toString());

                           }



                        // await FirebaseServices.login(_emailController.text.trim(),_passwordController.text.trim()).then((value){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Homenew(),)) ;
                        // }
                        // );

                        //Navigator.pushNamed(context, "/Homenew");
                        //here i call the function i used above
                        //login(email, password);
                      } else {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Please Fill above Fields Correctly ',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // SnackBar(content: Text("in valid data"));
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/resetpass");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ])),
      ),
    ));
  }
}

