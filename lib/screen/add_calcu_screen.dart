import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_learn/provider/test_provider.dart';

class CreateNewCalculatorScreen extends StatefulWidget {
  const CreateNewCalculatorScreen({super.key});

  @override
  State<CreateNewCalculatorScreen> createState() =>
      _CreateNewCalculatorScreenState();
}

class _CreateNewCalculatorScreenState extends State<CreateNewCalculatorScreen> {
  List jumlahField = [];
  @override
  Widget build(BuildContext context) {
    var getTest = Provider.of<testProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Calculator"),
      ),
      body: Column(
        children: [
          Container(
            
            height: 200,
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
                  itemCount: getTest.count,
                  itemBuilder: (context, idx) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("$idx"),
                        SizedBox(
                          width: 200,
                          child: TextField(),
                        )
                      ],
                    );
                  }),
            
          ),
          IconButton(
              onPressed: () {
                getTest.addCount();
              },
              icon: const Icon(Icons.add),color: Colors.amber,)
        ],
      ),
    );
  }
}
