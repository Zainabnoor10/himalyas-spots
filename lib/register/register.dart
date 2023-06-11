import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:himalayas_spots/login/login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  
  Future saveUserData(String email, String password,String phone,String name,String address) async {

   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return
      firestore
        .collection('users').doc() // Optionally, you can specify a document ID here
        .set({
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
      'address': address,
      // Add more fields as needed
    });
  }
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _contactnumController=TextEditingController();
  TextEditingController _addressController=TextEditingController();


  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _contactnumController.dispose();
    _addressController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              key:formkey,
              child:Column(
                  children: [
                    SizedBox(
                      height: 66,
                    ),
                    Container(
                      height:200,
                      width: 300,
                      child: Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor:Colors.transparent,
                          child:ClipOval(
                            child: Image.asset("assets/loginlogo.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: 300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          height: 65,
                          width: 374,
                          decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 235, 235, 1.0),
                              borderRadius: BorderRadius.circular(10),
                          ),
                              child: TextFormField(
                               controller: _nameController,
                               minLines: 1,
                            keyboardType: TextInputType.text,
                            onChanged: (value){
                              print(value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter name";
                              } else {
                                return null;
                              }
                            },

                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Zain",

                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),

                                    child: Icon(Icons.person,color: Color(
                                        0xff0a640a)

                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    margin: EdgeInsets.only(left: 3, right: 3),
                                    color: Color(
                                        0xff0a640a), // Set the color of the line here
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),

                          )
                      ),
                    ),
                    SizedBox(
                      height:18,

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          height: 65,
                          width: 374,
                          decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 235, 235, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            minLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
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
                              hintText: "abc@gmail.com ",

                              icon: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.mail,color: Color(
                                        0xff0a640a)),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    margin: EdgeInsets.only(left: 10, right: 10),
                                    color:Color(
                                        0xff0a640a),
                                    // Set the color of the line here
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),

                          )
                      ),
                    ),
                    SizedBox(
                      height:18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 65,
                        width: 374,
                        decoration: BoxDecoration(
                        color: Color.fromRGBO(238, 235, 235, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          onChanged: (value){
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
                          decoration: InputDecoration(
                            hintText: "12345",


                            icon: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.lock_outlined,color: Color(
                                      0xff0a640a)),
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(
                                      0xff0a640a) // Set the color of the line here
                                ),
                              ],
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 65,
                        width: 374,
                        decoration: BoxDecoration(
                        color: Color.fromRGBO(238, 235, 235, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _contactnumController,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          onChanged: (value){
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a phone number';
                            } else if (value.length != 11) {
                              return 'Phone number must be 10 digits';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "0111112222",
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.phone,color: Color(
                                      0xff0a640a)),
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(
                                      0xff0a640a) // Set the color of the line here
                                ),
                              ],
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 65,
                        width: 374,
                        decoration: BoxDecoration(
                        color: Color.fromRGBO(238, 235, 235, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _addressController,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          onChanged: (value){
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Abbottabad",


                            icon: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.location_on,color: Color(
                                      0xff0a640a)),
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(
                                      0xff0a640a) // Set the color of the line here
                                ),
                              ],
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    //
                    SizedBox(
                        height: 85
                    ),
                    Container(
                      height: 60,
                      width: 330 ,
                      decoration:BoxDecoration(color: Color(
                          0xff0a640a),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: ()  async {
                              if (formkey.currentState!.validate()) {
                                //here i check when the button is pressed first it will
                                //check the validation then it will get all the values user entered
                                //and save it in variables eg email,password,etc

                                String email = _emailController.text.trim();
                                String password = _passwordController.text.trim();
                                String phone = _contactnumController.text.trim();
                                String name = _nameController.text.trim();
                                String address = _addressController.text.trim();
                               await saveUserData(email, password, phone, name, address).whenComplete(() {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));

                                });



                                // //here i save the user input data in firestore
                                // saveUserData(email, password, phone, name,address)
                                //     .then((_) => print('User data saved to Firestore'))
                                //     .catchError((error) => print('Error saving user data: $error'));
                                // // simple navigation to go to login page
                                // Navigator.pushNamed(context, '/login');
                              }
                            },
                            child: Center(child: Container(child: Text("Submitted",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),))),
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 125,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have a account",style:TextStyle(color: Colors.black26) ,),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context,'/login');
                        }, child:Text("Log In.",style:TextStyle(color: Colors.green,fontWeight:FontWeight.bold )))
                      ],
                    )
                  ])
          )
      ),
    );

  }
}