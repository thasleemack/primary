import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:primary/Providers/login_provider.dart';
import 'package:primary/screens/users/home.dart';
import 'package:provider/provider.dart';

import '../constants/my_colors.dart';
import '../constants/my_functions.dart';
import '../constants/my_texts.dart';


class otppage extends StatelessWidget {
  const otppage({super.key});
  get controller => null;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 20),
              child: Text("Enter your OTP",style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w800,color: Colors.amber.shade50),),
            ),
            Consumer<LoginProvider>(
              builder: (context,value,child) {
                return Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        Text("Please enter the verification code sent",style: TextStyle(
                            fontWeight: FontWeight.normal,fontSize: 12,color: Colors.amber.shade50),),
                        Text("to +91 9074552753",style: TextStyle(
                            fontWeight: FontWeight.normal,fontSize: 12,color: Colors.amber.shade50),),
                        SizedBox(height: 30,),
                        Padding(
                            padding:  EdgeInsets.only(right: 15),
                            child: Consumer<LoginProvider>(
                              builder: (context,value,child) {
                                return Pinput(
                                  controller: value.otpController,
                                  length: 6,
                                  defaultPinTheme: PinTheme(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: clEAEBFF1,
                                        borderRadius: BorderRadius.circular(10),

                                      ),textStyle: TextStyle(color:clBlack)
                                  ),
                                  onCompleted: (data) {
                                    value.verify(context);
                                  },

                                );
                              }
                            )

                        ),
                      ]
                  ),

                );
              }
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                callNext(Home(), context,);
              },
              child: Center(
                child: Container(
                  height: 45,
                  width: width/3,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(42),color: clWhite),
                  child: Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: clBlue,
                        fontFamily: fontRegular,
                        fontSize: textSize16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),





    );
  }
}
