import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_learn/model/user_model.dart';
import 'package:sqlite_flutter_learn/provider/user_provider.dart';
import 'package:sqlite_flutter_learn/service/sqlite_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    // TODO: implement initState

    Provider.of<userProvider>(context,listen: false).refreshUser();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    SqliteService.instane.close();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var loadUser = Provider.of<userProvider>(context);
    var getUser = loadUser.users;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
          child: Column(
        children: [
          const Text("Data"),
          IconButton(
              onPressed: () {
                loadUser.refreshUser();
              },
              icon: const Icon(Icons.refresh)),
          Flexible(
            child: ListView.builder(
                itemCount: getUser.length,
                itemBuilder: (context, idx) {
                  return ListTile(
                    title: Text(getUser[idx].name),
                    subtitle: Text(getUser[idx].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                loadUser.editUser(User(
                                    id: int.parse(getUser[idx].id.toString()),
                                    name: "wuddoke",
                                    username: "wudyoke",
                                    email: "wudd@gmai.com",
                                    password: "nice123",
                                    createdTime: DateTime.now()),int.parse(getUser[idx].id.toString()));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                loadUser.deleteUser(int.parse(getUser[idx].id.toString()));
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
            loadUser.insertUser(User(
                name: "wudd",
                username: "wudy",
                email: "wudd@gmai.com",
                password: "nice123",
                createdTime: DateTime.now()));
          }),
    );
  }
}
