import 'package:flutter/material.dart';
import 'package:interintel/presentation/home_screen.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key,required this.name, required this.email, required this.phone}) : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  name: widget.name,
                  email: widget.email,
                  phone: widget.phone,
                ),
              ),
            );
          },
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/images/profile.png'),
              title: Text('${widget.name}'),
              subtitle: Text('${widget.email} , ${widget.phone} '),
            ),
          ],
        ),
      ),
    );
  }
}
