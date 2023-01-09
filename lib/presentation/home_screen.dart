import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:interintel/presentation/design_screen.dart';
import 'package:interintel/presentation/dictionary_screen.dart';
import 'package:interintel/presentation/info_screen.dart';
import 'package:interintel/presentation/response_screen.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      InfoScreen(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
      DesignScreen(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
      ResponseScreen(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
      DictionaryScreen(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      )
    ];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 10,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  const GButton(
                    icon: LineIcons.home,
                    text: 'Info',
                  ),
                  const GButton(
                    icon: LineIcons.database,
                    text: 'Design',
                  ),
                  const GButton(
                    icon: LineIcons.addressBook,
                    text: 'Response',
                  ),
                  const GButton(
                    icon: LineIcons.book,
                    text: 'Dictionary',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        body: _widgetOptions?.elementAt(_selectedIndex),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    _onBackPressed();
    return true;
  }

  Object _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to exit the App'),
          actions: <Widget>[
            MaterialButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(false); //Will not exit the App
              },
            ),
            MaterialButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                exit(0);
              },
            )
          ],
        );
      },
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
