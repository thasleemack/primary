import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primary/Providers/main_provider.dart';
import 'package:primary/screens/admins/users_list_screen.dart';
import 'package:primary/screens/login_screen.dart';
import 'package:primary/screens/users/register_screen.dart';
import 'package:provider/provider.dart';
import '../../constants/my_colors.dart';
import '../../constants/my_functions.dart';
import '../../constants/my_texts.dart';
import '../../constants/my_widgets.dart';
import 'event_screen.dart';
class Adminhome extends StatelessWidget {
  const Adminhome({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,

      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(textAlign: TextAlign.center,
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
                        clBlue,
                        clgradient2,
                        clgradient1

                        // yellowgrad2.withOpacity(1),
                      ]
                  ).createShader(Rect.fromLTWH(15, 200,195,70)), // Apply gradient only to the selected container

              ),
            ),
          ),
          SizedBox(height: 30,),
          Consumer<AdminProvider>(
            builder: (context,value,child) {
              return Center(
                  child: InkWell(
                      onTap: (){
                        value.getEvent();
                        callNext(Eventsscreen(), context,);
                      },
                      child: Category('Events',context)));
            }
          ),
          SizedBox(height: 10,),
          Consumer<AdminProvider>(
            builder: (context,value,child) {
              return InkWell(
                  onTap: (){
                    value.getCustomers();
                    callNext(Customerlist(),context, );
                  },
                  child: Category('Users List',context));
            }
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.teal.shade50,

                  actions: <Widget>[
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/50,),
                        Container(
                          // height: height/5,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(5),
                              color: Colors.black26),
                        ),
                        Text(
                          "Are you sure want to log out?",
                          style: TextStyle(
                              fontSize: 15,

                              color:Colors.black
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: width/3.5,),
                            TextButton(onPressed: (){
                              // value.DeleteCarDetails(items.id,Brandid,context);
                              // back(context);
                              FirebaseAuth auth = FirebaseAuth.instance;
                              auth.signOut();
                                callNextReplacement(context,  LoginPage());
                            }, child:Text("Yes",style: TextStyle( color: Colors.black),) ),
                            TextButton(onPressed: (){
                              // back(context);

                            }, child:Text("No",style: TextStyle(color: Colors.red),) ),

                          ],
                        )

                      ],
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 40,
              width: width/3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(42),color:clEAEBFF1),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_outlined,color: clgradient1,),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: clgradient1,
                      fontFamily: fontRegular,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}