import 'package:flutter/material.dart';
import 'package:interintel/presentation/splash_screen.dart';

void main() {
  runApp(MyApp(name:'name', email: 'email', phone: 'phone',
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
    );
  }
}
