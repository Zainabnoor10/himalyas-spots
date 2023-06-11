


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:himalayas_spots/adminf/seepost.dart';
import 'package:himalayas_spots/crud/crud.dart';
import 'package:himalayas_spots/firebaseoperation/firebaseoperation.dart';
import 'package:himalayas_spots/home/Homenew.dart';
import 'package:himalayas_spots/home/adminpost.dart';
import 'package:himalayas_spots/home/home.dart';
import 'package:himalayas_spots/home/home1.dart';
import 'package:himalayas_spots/home/pak_home.dart';
import 'package:himalayas_spots/login/login.dart';
import 'package:himalayas_spots/register/register.dart';
import 'package:himalayas_spots/shogranscreen/shogranscreen.dart';
import 'package:himalayas_spots/splash_screen.dart';
import 'adminf/loginf.dart';
import 'attractionpointnaran/attractionpointnaran.dart';
import 'balakotscreen/balakotscreen.dart';
import 'detail classes/detail1.dart';
import 'kaghanscreen/kaghanscreen.dart';
import 'login/loginas.dart';
import 'naranscreen/attractionpointnaran/attractionpointnaran.dart';
import 'naranscreen/hospitalnaran.dart';
import 'naranscreen/naranhotel.dart';
import 'naranscreen/naranscreen.dart';
import 'naranscreen/workshopfuelstationnaran.dart';





Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '',
    initialRoute: "/",
    routes: {
      "/": (context) => const Splashscreen(),
      "/loginas": (context) => const logo(),
      "/register": (context) => const Register(),
      "/login": (context) => const login(),
      "/home": (context) => const HomeScreen(),
      "/home1": (context) => const HomeScreen1(),
      "/detail1": (context) => const Detail(),
      "/Homenew": (context) => Homenew (),
      "/firebaseoperation": (context) => Stream(),
      "/crud": (context) => Operations(),
      '/naranscreen' : (context) => const Naranscreen(),
      '/shogranscreen' : (context) => const Shogranscreen(),
      '/kaghanscreen' : (context) => const Kaghanscreen(),
      '/balakotscreen' : (context) => const Balakotscreen(),
      '/attractionpointnaran': (context) =>  Attractionpointnaran(),
      '/workshopfuelstationnaran' : (context) => WorkShop(),
      '/hospitalnaran' : (context) => Hospitals(),
      '/naranhotel' : (context) => HotelScreen(),
      '/seepost' : (context) => Adminpost(),

      '/adminpost' : (context) => News(),
      '/loginf' : (context) => loginasadmin(),




      //  "/pak_home" : (context) => HomeScreenPak(),


    }

  ));

}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacementNamed(context, '/loginas');
//     }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(MediaQuery.of(context).size.height);
//     print(MediaQuery.of(context).size.width);
//     return Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               // margin: EdgeInsets.symmetric(horizontal: 10),
//              height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//
//               child: AnimatedSplashScreen(
//               splash :Image.asset("assets/arreej.jpg",height: double.infinity,),
//                 backgroundColor:Colors.lightGreen,
//                 nextScreen:const logo(),
//                 splashIconSize:250,
//                 duration:20,
//                 splashTransition: SplashTransition.sizeTransition,
//                 animationDuration: const Duration(seconds: 15),
//             ),
//     )
//
//           ],
//           // children: [
//         )
//     );
//   }
// }

