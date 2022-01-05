import 'package:email_auth/email_auth.dart';
import 'package:faults_app/calls/calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

EmailAuth emailAuth = new EmailAuth(sessionName: "Sam");

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOTP() async {
    emailAuth.sessionName = "Sam";
    var res =
        await emailAuth.sendOtp(recipientMail: _emailController.value.text);
    if (res) {
      print("OTP successfully sent");
    } else {
      print("OTP was not successfully sent");
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text);
    if (res) {
      print("Email is Verified");
    } else {
      print("Invalid OTP");
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
          title: Text('Verify Email'),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      suffixIcon: TextButton(
                        child: Text("Send OTP"),
                        onPressed: () => sendOTP(),
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter the OTP Sent to the email",
                    labelText: "OTP",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    child: Text("Verify OTP"),
                    onPressed: () {
                      var res = emailAuth.validateOtp(
                          recipientMail: _emailController.value.text,
                          userOtp: _otpController.value.text);
                      if (res) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) => calls()));
                      } else {
                        print("Invalid OTP");
                      }
                      () => verifyOTP();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
