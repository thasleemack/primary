import 'package:flutter/material.dart';
import 'package:primary/Providers/main_provider.dart';
import 'package:primary/screens/users/register_screen.dart';
import 'package:provider/provider.dart';
import '../../constants/my_colors.dart';
import '../../constants/my_functions.dart';
import '../../constants/my_texts.dart';
import 'admin_home_screen.dart';

class Customerlist extends StatelessWidget {
  const Customerlist({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      appBar:  AppBar(
        backgroundColor: clgreyblk,
        leading: InkWell(
            onTap: (){
              callNext(context,Adminhome(),);
            },
            child: Icon(Icons.arrow_back,color: clWhite,size: 20,)),
        title: Text(
          'Users List',
          style: TextStyle(
            color: clWhite,
            fontFamily: fontRegular,
            fontSize: textSize25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body:  Consumer<AdminProvider>(
        builder: (context,value,child) {
          return SizedBox(
              child: ListView.builder(
                itemCount: value.customersList.length,
                itemBuilder: (context, index) {
                  var item = value.customersList[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: 200,
                          width: width/1.04,
                          decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.60),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height:80,
                                        width: width/3.40,
                                        decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Image.network(item.photo,fit: BoxFit.fill,)
                                    ),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(left: 10,top: 7),
                                              child: Text("Name:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding:  EdgeInsets.only(top: 8),
                                              child: Text(item.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(left: 10,top: 7),
                                              child: Text("Phone No:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding:  EdgeInsets.only(top: 8),
                                              child: Text(item.phone,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                                      "Are you sure want to Edit?",
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

                                                        }, child:Consumer<AdminProvider>(
                                                          builder: (context,vaue,child) {
                                                            return InkWell(
                                                                onTap: (){
                                                                  value.getCustomerEdit(item.id);
                                                                  callNext(Registration(from: "EDIT",Id: item.id,),context, );
                                                                },
                                                                child: Text("Yes",style: TextStyle( color: Colors.black),));
                                                          }
                                                        ) ),
                                                        TextButton(onPressed: (){
                                                          value.deleteCustomer(item.id,context);
                                                          finish(context);

                                                        }, child:Text("No",style: TextStyle(color: Colors.red),) ),

                                                      ],
                                                    )

                                                  ],
                                                ),
                                              ],
                                            )
                                        );
                                      },
                                      child: Container(
                                        height:30,
                                        width: width/5,
                                        decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
                                            borderRadius: BorderRadius.circular(4)),
                                        child: Center(child: Text("Edit",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    InkWell(onTap: (){
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
                                                    "Are you sure want to Delete?",
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
                                                        back(context);

                                                      }, child:Text("Yes",style: TextStyle( color: Colors.black),) ),
                                                      TextButton(onPressed: (){
                                                        // back(context);

                                                      }, child:Text("No",style: TextStyle(color: Colors.red),) ),

                                                    ],
                                                  )

                                                ],
                                              ),
                                            ],
                                          )
                                      );
                                    },
                                      child: Container(
                                        height:30,
                                        width: width/5,
                                        decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
                                            borderRadius: BorderRadius.circular(4)),
                                        child: Center(child: Text("Delete",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },)
            // :Center(child: Text("Empty...!",style: TextStyle(color: Colors.white,fontSize: 15),));

          );
        }
      ),

    );
  }
}