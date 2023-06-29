import 'package:flutter/material.dart';



class DynamicTexfield extends StatefulWidget {
  const DynamicTexfield({super.key});

  @override
  State<DynamicTexfield> createState() => _DynamicTexfieldState();
}

class _DynamicTexfieldState extends State<DynamicTexfield> {
  var textFieldController = TextEditingController();
  List<Widget> txtField = [];
  List<TextEditingController> cntrlText = [];

  @override
  void initState() {
    // TODO: implement initState

    // txtField.add(buildTextField());
    addTextField();


    super.initState();

  }

  void resultHandle(){
    for(var controller in cntrlText){
      print(controller.text);
    }
  }

  Widget buildTextField(TextEditingController controller){
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: "test"
      ),
    );
  }

  void addTextField(){
    setState(() {
      TextEditingController newcontroller = TextEditingController();
      txtField.add(buildTextField(newcontroller));
      cntrlText.add(newcontroller);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin:const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: txtField,
            ),
          IconButton(onPressed: (){
            addTextField();
          }, icon:const Icon(Icons.add)),
          ElevatedButton(onPressed: (){
            resultHandle();
          }, child:const Text("Result"))
          ],
        ),
      ),
    );
  }
}