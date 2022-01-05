import 'package:faults_app/api/api.dart';
import 'package:faults_app/models/fault.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFaultScreen extends StatefulWidget {
  @override
  _AddFaultScreenState createState() => _AddFaultScreenState();
}

class _AddFaultScreenState extends State<AddFaultScreen> {
  final faultTitleController = TextEditingController();
  final faultDesController = TextEditingController();

  get id => id;

  void onAdd() {
    final String textVal = faultTitleController.text;
    final String desVal = faultDesController.text;

    if (textVal.isEmpty && desVal.isNotEmpty) {
      final Fault fault = Fault(
        title: textVal,
        description: desVal,
        id: id,
      );
      Provider.of<FaultProvider>(context, listen: false).addFault(fault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SingleChildScrollView(
            child: AppBar(
          centerTitle: true,
          title: Text('Add Fault'),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        )),
      ),
      extendBodyBehindAppBar: false,
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              TextField(
                controller: faultTitleController,
              ),
              TextField(
                controller: faultDesController,
              ),
              ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  })
            ],
          ))
        ],
      ),
    );
  }
}
