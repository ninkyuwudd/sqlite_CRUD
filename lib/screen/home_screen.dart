import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/route.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Column(
          children: [
            Text("test"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, Routes.addCalculator);
        }),
    );
  }
}