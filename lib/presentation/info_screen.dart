import 'package:flutter/material.dart';
import 'package:interintel/presentation/design_screen.dart';
import 'package:interintel/presentation/home_screen.dart';
import 'package:interintel/theme/app_style.dart';
import 'package:interintel/theme/size_utils.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    Key? key,required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool value = false;
  bool onError = false;

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The name field is required.';
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
          labelText: "Name",
          labelStyle: AppStyle.txtInterMedium12.copyWith(
            letterSpacing: 0.50,
            height: 1.00,
          ),
          fillColor: Colors.grey[100]),
    );

    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The email field is required.';
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
          labelText: "Email",
          labelStyle: AppStyle.txtInterMedium12.copyWith(
            letterSpacing: 0.50,
            height: 1.00,
          ),
          fillColor: Colors.grey[100]),
    );

    final phoneField = TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
          labelText: "Phone Number",
          labelStyle: AppStyle.txtInterMedium12.copyWith(
            letterSpacing: 0.50,
            height: 1.00,
          ),
          fillColor: Colors.grey[100]),
    );

    Future<void> submitForm() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState?.save();
        print('Form submitted');
      }
    }

    final addUser = Material(
      child: FutureBuilder(
        future: submitForm(),
          builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading...');
          } else {
            return ElevatedButton(
              onPressed: () {
                  formKey.currentState?.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User added successfully")));
              },
              child: Text('Add User'),
            );
          }
          }
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: getVerticalSize(64.00),
                width: getHorizontalSize(380.00),
                margin: getMargin(left: 24, top: 35, right: 24),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: nameField,
                    )
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(64.00),
                width: getHorizontalSize(380.00),
                margin: getMargin(left: 24, top: 15, right: 24),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: emailField,
                    )
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(64.00),
                width: getHorizontalSize(380.00),
                margin: getMargin(left: 24, top: 15, right: 24),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: phoneField,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(bottom: 2),
                      child: isLoading ? CircularProgressIndicator() : addUser,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
