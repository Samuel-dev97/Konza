import 'package:email_auth/email_auth.dart';
import 'package:faults_app/api/api.dart';
import 'package:faults_app/calls/calls.dart';
import 'package:faults_app/registration/register.dart';
import 'package:faults_app/screens/retrieve.dart';
import 'package:faults_app/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: WelcomeScreen(),
    );
  }
}
