import 'package:faults_app/calls/calls.dart';
import 'package:faults_app/registration/login.dart';
import 'package:faults_app/screens/reset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RetrieveScreen extends StatefulWidget {
  @override
  _RetrieveScreenState createState() => _RetrieveScreenState();
}

class _RetrieveScreenState extends State<RetrieveScreen> {
  late String _name, mother, bola;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SingleChildScrollView(
            child: AppBar(
          centerTitle: true,
          title: Text('Questions for password retrieval'),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        )),
      ),
      extendBodyBehindAppBar: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Fathers name'),
              onChanged: (value) {
                setState(() {
                  _name = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Mothers name'),
              onChanged: (value) {
                setState(() {
                  mother = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'favorite football team'),
              onChanged: (value) {
                setState(() {
                  bola = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => calls()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class RetrievalScreen extends StatefulWidget {
  @override
  _RetrievalScreenState createState() => _RetrievalScreenState();
}

class _RetrievalScreenState extends State<RetrievalScreen> {
  late String _name, mother1, bola1;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SingleChildScrollView(
            child: AppBar(
          centerTitle: true,
          title: Text('Enter the Questions You Set For Password Retrieval'),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        )),
      ),
      extendBodyBehindAppBar: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Fathers name'),
              onChanged: (value) {
                setState(() {
                  _name = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Mothers name'),
              onChanged: (value) {
                setState(() {
                  mother1 = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'favorite football team'),
              onChanged: (value) {
                setState(() {
                  bola1 = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  child: Text('SUBMIT'),
                  onPressed: () {
                    if (bola1 == bola1) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ResertScreen()));
                    } else {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login()));
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
