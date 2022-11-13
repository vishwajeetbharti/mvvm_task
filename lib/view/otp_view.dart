import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../view_model/auth_view_model.dart';
import 'login_view.dart';

class OtpVerification extends StatefulWidget {
  OtpVerification({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    LoginAuth.verifyOtp(widget.verificationId, code, context);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Login_Screen()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text("Edit Phone Number ?"))
            ],
          ),
        ));
  }
}
