import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:interintel/presentation/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 5000,
        splash: Image.asset('assets/images/Interintel_Logo_1.png'),
        nextScreen: HomeScreen(
          name: widget.name,
          email: widget.email,
          phone: widget.phone,
        ),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
      ),
    );
  }
}
