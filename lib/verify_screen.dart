import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with CodeAutoFill {

  String codeValue="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),

      body:Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PinFieldAutoFill(
              currentCode:codeValue ,
              codeLength: 4,
              onCodeChanged: (val)
              {
                print("onCodeChanged $val");
                setState((){codeValue=val.toString();});
              },
              onCodeSubmitted: (code)
              {
                print("oncodeSubmittee $code");
              },
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){print(codeValue);}, child: Text("verify otp")),

            ElevatedButton(onPressed: listenOtp, child:Text("resend"))



          ],
        ),
      ),
    );
  }

  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
    print("update code $code");
    setState((){print("codeUpdated");});
  }


  @override
  void initState()
  {
    super.initState();
    listenOtp();
  }


//functio to auto read and fill the otp
  void listenOtp()async
  {
    await SmsAutoFill().unregisterListener();
    listenOtp();
    await SmsAutoFill().listenForCode();

    print("otp listner is called");
  }

  @override
  void dispose()
  {
    SmsAutoFill().unregisterListener();
    print("unregisterListner");
    super.dispose();
  }

}
