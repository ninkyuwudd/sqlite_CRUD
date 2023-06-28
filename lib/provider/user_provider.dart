import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/sqlite_service.dart';

class userProvider extends ChangeNotifier {
  late List<User> user = [];
  List<User> get users => user;
  bool isLoading = false;

  Future refreshUser() async {
    isLoading = true;

    this.user = await SqliteService.instane.readAllUser();

    isLoading = false;
    notifyListeners();
  }

  Future<void> insertUser(User user) async {
    final createdUser = await SqliteService.instane.create(user);
    users.add(createdUser);
    refreshUser();
    print("try to add data");
    notifyListeners();
  }

  Future deleteUser(int id) async {
    await SqliteService.instane.delete(id);
    refreshUser();
    notifyListeners();
  }

  Future editUser(User user, int id) async {
    await SqliteService.instane.update(user, id);
    refreshUser();
    notifyListeners();
  }
}
