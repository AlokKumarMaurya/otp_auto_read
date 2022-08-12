import 'package:flutter/material.dart';
import 'package:otp_auto_fill_app/verify_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SendOTPScreen extends StatelessWidget {
  const SendOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController mobileNumber=TextEditingController();


    void submit()async
    {
      if(mobileNumber.text=="") return;

      var appSignatureID=await SmsAutoFill().getAppSignature;
      Map sendOtpData={
        "mobile_number":mobileNumber.text,
        "app_signature_id":appSignatureID
      };
      print(sendOtpData);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOTPScreen()));
    }


    return Scaffold(
      backgroundColor: Colors.pink,

      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter youe mobile number"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed:submit, child:Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
