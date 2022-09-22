import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/Home.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNo;

  OtpScreen({this.mobileNo});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String mVerificationId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendOtp();
  }

  Future<void> sendOtp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: widget.mobileNo,

      verificationCompleted:
          (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));},

      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },

      codeSent: (String verificationId, int resendToken) async {
        mVerificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: otpController,
                decoration: InputDecoration(hintText: 'Enter OTP'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () async {
                    String smsCode = otpController.text;

                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                    PhoneAuthProvider.credential(
                        verificationId: mVerificationId, smsCode: smsCode);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                  },
                  child: Text("VERIFY")),
            ),
          ],
        ),
      ),
    );
  }
}
