import 'package:faults_app/registration/register.dart';
import 'package:faults_app/screens/addFault.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class calls extends StatefulWidget {
  @override
  State<calls> createState() => _callsState();
}

class _callsState extends State<calls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: SingleChildScrollView(
              child: AppBar(
            centerTitle: true,
            title: Text('Select The Fault Category'),
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          )),
        ),
        extendBodyBehindAppBar: false,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: AssetImage('assets/images/hardware.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => MyApp()));
                    },
                  ),
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Hardware',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Ink.image(
                  image: AssetImage('assets/images/software.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => MyApp()));
                    },
                  ),
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Software',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Ink.image(
                  image: AssetImage('assets/images/maintenance.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Maintenance',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Ink.image(
                  image: AssetImage('assets/images/repair.png'),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 6),
                Text(
                  'Repair',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
