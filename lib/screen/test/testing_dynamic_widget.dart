import 'dart:ffi';

import 'package:flutter/material.dart';

class DynamicTexfield extends StatefulWidget {
  const DynamicTexfield({super.key});

  @override
  State<DynamicTexfield> createState() => _DynamicTexfieldState();
}

class _DynamicTexfieldState extends State<DynamicTexfield> {
  var textFieldController = TextEditingController();
  var resultController = TextEditingController();
  var hasil = 0;
  List<Widget> txtField = [];
  List<TextEditingController> cntrlText = [];

  @override
  void initState() {
    // TODO: implement initState

    // txtField.add(buildTextField());
    addTextField();

    super.initState();
  }

  void resultHandle(String x, String y) {
    for (var controller in cntrlText) {
      print(controller.text);
    }

    setState(() {
      hasil = int.parse(x) + int.parse(y);
    });
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      onChanged: (value) {},
      controller: controller,
      decoration: const InputDecoration(hintText: "test"),
    );
  }

  void addTextField() {
    setState(() {
      TextEditingController newcontroller = TextEditingController();
      txtField.add(buildTextField(newcontroller));
      cntrlText.add(newcontroller);
    });
  }

  void resultFormula() {
    String rslt = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: txtField,
            ),
            IconButton(
                onPressed: () {
                  addTextField();
                },
                icon: const Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  resultHandle(cntrlText[0].text, cntrlText[1].text);
                },
                child: const Text("Result")),
            const SizedBox(
              width: 200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("+"),
                  SizedBox(
                    width: 20,
                  ),
//                   Text("""
// ${cntrlText[0].text} + ${cntrlText[1].text}
// Result = $hasil
// """),
                  // Expanded(
                  //   child: TextField(
                  //     controller: ,
                  //   )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
