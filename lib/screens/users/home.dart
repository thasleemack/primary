import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../constants/my_texts.dart';




class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: clDADADA,
        title: RichText(textAlign: TextAlign.center,
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
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                // callNext(Profile(), context);
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: clwhitesecondary,
                  child: Icon(Icons.person_outline_outlined,color: clBlue,)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  height: height/15,
                  // width: width,
                  decoration: BoxDecoration(
                      color: clWhite,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                            offset: Offset(3, 4),
                            blurRadius: 8,
                            spreadRadius: -1,
                            color: Colors.black12),
                      ]
                  ),
                  child: TextField(
                    cursorColor:Colors.grey,
                    decoration: InputDecoration(
                      fillColor:clWhite,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(30) ,
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.search,color:clBlue,size: 24,),
                      hintText: "Search Program",
                      hintStyle: TextStyle(
                        color:clBlue,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontRegular,
                        fontSize: textSize12,
                      ),
                    ),
                  )
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: height,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10,);
                  },
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return  Container(
                      // height: 200,
                      width: width,
                      decoration: BoxDecoration(
                          color: clWhite,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height:100,
                              width: width,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                image: DecorationImage(image: AssetImage('assets/images/oppana2.jpg'),fit: BoxFit.fill),
                              ),

                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Program:',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Oppana',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Time:',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '10:00 Am',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Date:',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '10/8/2024',
                                  style: TextStyle(
                                    color: clBlue,
                                    fontFamily: fontRegular,
                                    fontSize: textSize16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 40,
                              width: width/4.5,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(42),color:Colors.brown),
                              child: Center(
                                child: Text(
                                  'Participate',
                                  style: TextStyle(
                                    color: clWhite,
                                    fontFamily: fontRegular,
                                    fontSize: textSize12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              )


            ],
          ),
        ),
      ),
    );
  }
}