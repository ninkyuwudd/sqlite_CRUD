import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/model/user_model.dart';
import 'package:sqlite_flutter_learn/service/sqlite_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late List<User> user = [];
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

  Future<void> insertUser(User user) async {
    final createdUser = await SqliteService.instane.create(user);
    users.add(createdUser);
    refreshUser();
    print("try to add data");
  }

  Future deleteUser(int id) async {
    await SqliteService.instane.delete(id);
    refreshUser();
  }

  Future editUser(User user,int id) async {
    await SqliteService.instane.update(user,id);
    refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
          child: Column(
        children: [
          const Text("Data"),
          IconButton(
              onPressed: () {
                refreshUser();
              },
              icon: const Icon(Icons.refresh)),
          Flexible(
            child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, idx) {
                  return ListTile(
                    title: Text(user[idx].name),
                    subtitle: Text(user[idx].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                editUser(User(
                                    id: int.parse(user[idx].id.toString()),
                                    name: "wuddoke",
                                    username: "wudyoke",
                                    email: "wudd@gmai.com",
                                    password: "nice123",
                                    createdTime: DateTime.now()),int.parse(user[idx].id.toString()));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteUser(int.parse(user[idx].id.toString()));
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    
                  );
                }),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            insertUser(User(
                name: "wudd",
                username: "wudy",
                email: "wudd@gmai.com",
                password: "nice123",
                createdTime: DateTime.now()));
          }),
    );
  }
}
