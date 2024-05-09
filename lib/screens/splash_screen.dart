import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primary/primary%20project.dart';
import 'package:primary/screens/users/register_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/login_provider.dart';
import '../constants/my_colors.dart';
import '../constants/my_functions.dart';
import '../constants/my_texts.dart';
import 'login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);
    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;
    Timer( Duration(seconds: 5), () {
      if(loginUser==null){

      callNextReplacement( Registration(from: "NEW",Id: "",),context,);
      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:clWhite,
        body:Container(
          width: width,
          height: height,
          // color: Colors.blue,
          // decoration:BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/splash2.jpg'),fit: BoxFit.fill)
          // ),
          child:Center(
            child: RichText(textAlign: TextAlign.center,
              text:TextSpan(
                text:'Kalolsavam',
                style: TextStyle(
                  fontSize:textSize25 ,fontWeight: FontWeight.w700,fontFamily:fontRegular,
                  foreground: Paint()
                    ..shader =
                    LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          clgradient1,
                          clgradient2 ,

                          // yellowgrad2.withOpacity(1),
                        ]
                    ).createShader(Rect.fromLTWH(15, 200,195,70)), // Apply gradient only to the selected container

                ),
              ),
            ),
          ),
        )
    );
  }
}