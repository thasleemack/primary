import 'package:flutter/material.dart';
import 'package:primary/Providers/main_provider.dart';
import 'package:provider/provider.dart';
import '../../constants/my_colors.dart';
import '../../constants/my_functions.dart';
import '../../constants/my_texts.dart';
import 'add_event_screen.dart';
import 'admin_home_screen.dart';

class Eventsscreen extends StatelessWidget {
  Eventsscreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      appBar: AppBar(
        backgroundColor: clgreyblk,
        leading: InkWell(
            onTap: (){
              callNext(Adminhome(),context, ) ;
            },
            child: Icon(Icons.arrow_back,color: clWhite,size: 20,)),
        title: Text(
          'Events',
          style: TextStyle(
            color: clWhite,
            fontFamily: fontRegular,
            fontSize: textSize25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<AdminProvider>(
                builder: (context,value,child) {
                  return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount:value.eventList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing:1,
                        mainAxisSpacing: 1,
                        childAspectRatio:1.3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var item = value.eventList[index];

                        return Column(
                          children: [
                            InkWell(
                              onTap:(){
                                // callNext(context,Programss(), );
                              },
                              onLongPress: (){
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
                                              "Are you sure want to Edit or delete?",
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
                                                }, child:InkWell(
                                                    onTap: (){
                                                      value.editData(item.id);
                                                      callNext(Addnewevent(from: "EDIT",id: item.id,), context);
                                                    },
                                                    child: Text("Edit",style: TextStyle( color: Colors.black),)) ),
                                                TextButton(onPressed: (){
                                                  value.deleteEvent(item.id, context);
                                                  // back(context);

                                                  }, child:Text("Delete",style: TextStyle(color: Colors.red),) ),

                                              ],
                                            )

                                          ],
                                        ),
                                      ],
                                    )
                                );
                              },
                              child: Container(
                                height:100,
                                width: width/2.4,
                                decoration: BoxDecoration(
                                    color: clWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: NetworkImage(item.photo),fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(item.name,style: TextStyle(fontWeight: FontWeight.normal,
                                fontSize: 15,color:clBlue),),
                          ],
                        );
                      },
                    ),
                  );
                }
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.amber.shade50,size:30,),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.brown,
          onPressed: (){
            callNext(Addnewevent(from: "NEW",id: ""),context, );

          }),
    );
  }
}
