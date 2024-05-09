import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/login_provider.dart';
import '../constants/my_colors.dart';
import '../constants/my_functions.dart';
import '../constants/my_texts.dart';
import 'otp_screen.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color:clBlack),
                  borderRadius: BorderRadius.circular(22),
                  color: clDADADA
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10,top: 10),
                    child: Consumer<LoginProvider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.phoneController,
                          cursorColor:Colors.grey,
                          style: TextStyle(color:clblue),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText:'Phone',
                            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                            focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),

            ),

            SizedBox(height: 10,),
            Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return TextButton(
                      onPressed: (){
                        if(value.phoneController.text.length==10&&value.phoneController.text!='') {
                          db.collection("USERS").where("PHONE_NUMBER",isEqualTo: "+91${value.phoneController.text}").get().then((value) {
                            if(value.docs.isNotEmpty){
                              loginProvider. sendOtp(context);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                    "Sorry you don't have access",
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,)),
                              ));
                            }
                          });

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                                "Enter Valid PhoneNumber",
                                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,)),
                          ));
                        }
                      },
                      child: value.loader?const Center(child: CircularProgressIndicator(color: Colors.deepPurple,)): Text("Login!")
                  );
                }
            ),

          ],
        ),
      ),

    );
  }
}