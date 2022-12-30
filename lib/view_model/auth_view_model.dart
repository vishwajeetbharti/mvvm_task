import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_task/utils/utils.dart';

import '../constant/strings.dart';
import '../utils/routes_name.dart';
import '../view/otp_view.dart';
import 'shared_pref_model.dart';

class LoginAuth extends ChangeNotifier {
  static auth_Otp(
      String countryCode, String phone, BuildContext context) async {
    number = countryCode + phone;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countryCode + phone,
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => OtpVerification(
                      verificationId: verificationId,
                    )),
            (Route<dynamic> route) => false);
      },
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        Utils.flushBarErrorMessage("Something went wrong", context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static verifyOtp(String verificationId, String smsCode, context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      var user = await auth.signInWithCredential(credential);

      UserView.saveUser(user.user?.uid.toString() ?? '', number);
      Navigator.pushNamed(context, Pathname.home);
    } catch (e) {
      Utils.flushBarErrorMessage("Wrung Otp", context);
    }
  }
}
