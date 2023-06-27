import 'dart:math';

final String tableUser = "users";

class UserFields{
  static final List<String> values = [
    id,name,username,email,password,time
  ];


  static final String id = 'id';
  static final String name = 'name';
  static final String username = 'username';
  static final String email = 'email';
  static final String password = 'password';
  static final String time = 'time';
}


class User{
  final int? id;
  final String name;
  final String username;
  final String email;
  final String password;
  final DateTime createdTime;

  const User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.createdTime
  });

  User copy({
    int? id,
  String? name,
  String? username,
  String? email,
  String? password,
  DateTime? createdTime,
  }) => User(
    id: id?? this.id,
    name: name ?? this.name, 
    username: username ?? this.username, 
    email: email ?? this.email, 
    password: password ?? this.password, 
    createdTime: createdTime ?? this.createdTime,
    );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json[UserFields.id] as int?,
        name: json[UserFields.name] as String,
        username: json[UserFields.username] as String,
        email: json[UserFields.email] as String,
        password: json[UserFields.password] as String,
        createdTime: DateTime.parse(json[UserFields.time] as String),
    );



  Map<String, Object?> toJson() => {
    UserFields.id : id,
    UserFields.name : name,
    UserFields.username : username,
    UserFields.email : email,
    UserFields.password : password,
    UserFields.time : createdTime.toIso8601String()
  };


}