import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'login/loginas.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/loginas');
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/arreej.jpg'),
                fit: BoxFit.cover,
              ),
            )
        )
    );
  }
}









// class Splashscreen extends StatefulWidget {
//   const Splashscreen({Key? key}) : super(key: key);
//
//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }
//
// class _SplashscreenState extends State<Splashscreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     final s = MediaQuery.of(context).size;
//
//     return Scaffold(
//         body:  Container(
//           height: s.height,
//           width: s.width,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/arreej.jpg'),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child:AnimatedSplashScreen(
//             splash:Image.asset("assets/arreej.jpg"),
//             // Lottie.asset("assets/57458-rice.json"),
//             backgroundColor: Colors.black,
//             nextScreen: const logo(),
//             splashIconSize: 250,
//             duration:20,
//             splashTransition: SplashTransition.sizeTransition,
//             animationDuration: const Duration(seconds: 15),
//           ),
//         ));
//   }
// }
