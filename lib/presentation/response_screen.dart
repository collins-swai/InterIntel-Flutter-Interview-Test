import 'package:flutter/material.dart';
import 'package:interintel/core/model/response/TodoResponse.dart';
import 'package:interintel/data/network/network_service.dart';

import 'home_screen.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name;
  final String email;
  final String phone;

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  Future<List<TodoResponse>>? todoResponse;
  List<TodoResponse>? todo;

  NetworkService service = NetworkService();

  @override
  void initState() {
    super.initState();
    setState(() {
      todoResponse = service.getTodo();
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${todoResponse}");
      Future.delayed(const Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(
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
        child: FutureBuilder<List<TodoResponse>>(
            future: todoResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@${snapshot.data}");
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${snapshot.data?[index].title}"),
                        trailing: Text("${snapshot.data?[index].completed}"),
                      ),
                    );
                  },
                );
              }
              return const SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
        ),
      ),
    );
  }
}
