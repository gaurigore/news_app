import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/screen/otp_screen.dart';

class Login extends StatelessWidget {
  TextEditingController phoneController=TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(10.0)
                ),
              ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen(mobileNo: phoneController.text,)));


              }, child: Text("SUBMIT")),
            )
          ]),
      ),
    );
  }
}
