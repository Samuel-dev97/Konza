import 'package:email_auth/email_auth.dart';
import 'package:faults_app/api/api.dart';
import 'package:faults_app/calls/calls.dart';
import 'package:faults_app/screens/app.dart';
import 'package:faults_app/screens/retrieve.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'registration/register.dart';
import 'screens/addFault.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

EmailAuth emailAuth = new EmailAuth(sessionName: "Sam");

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FaultProvider(),
      child: MaterialApp(
        title: 'ATM Faults',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: HomePage(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  get name => name;

  @override
  Widget build(BuildContext context) {
    final faultP = Provider.of<FaultProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SingleChildScrollView(
            child: AppBar(
          centerTitle: true,
          title: Text('Select The Fault To Attend To'),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        )),
      ),
      extendBodyBehindAppBar: false,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: faultP.faults.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              trailing: IconButton(
                  icon: Icon(Icons.settings, color: Colors.grey),
                  onPressed: () {
                    faultP.deleteFault(faultP.faults[index]);
                  }),
              title: Text(faultP.faults[index].title),
              subtitle: Text(
                (faultP.faults[index].description),
              ));
        },
      ),
      /*  floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddFaultScreen()));
          }),
     */
    );
  }
}
