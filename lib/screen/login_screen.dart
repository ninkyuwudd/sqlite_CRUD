import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/model/user_model.dart';
import 'package:sqlite_flutter_learn/service/sqlite_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late List<User> user=[];
  List<User> get users => user;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    refreshUser();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    SqliteService.instane.close();

    super.dispose();
  }

  Future refreshUser() async {
    setState(() {
      isLoading = true;
    });

    this.user = await SqliteService.instane.readAllUser();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> insertUser(User user) async{
    final createdUser = await SqliteService.instane.create(user);
    users.add(createdUser);
    print("try to add data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
            children: [
              Text("Data"),
              Flexible(
                child: ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, idx) {
                      return Text(user[idx].name);
                    }),
              ),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              insertUser(
                User(name: "wudd", 
                username: "wudy", 
                email: "wudd@gmai.com", 
                password: "nice123", 
                createdTime: DateTime.now()
                ));
          }),
    );
  }
}
