import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primary/Providers/registration.dart';
import 'package:primary/second.dart';
import  'package:provider/provider.dart';

class Crud extends StatelessWidget {


  const Crud({super.key});

  // final CollectionReference Student =FirebaseFirestore.instance.collection('student');
  @override
  Widget build(BuildContext context) {
    Registration provider = Provider.of<Registration>(context, listen:false);
    provider.getStudentList();
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      floatingActionButton: Consumer<Registration>(
        builder: (context,value,child) {
          return FloatingActionButton(
            onPressed: () {
              provider.clear();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavePage(from: 'NEW',sId: '',)),
              );




              },
            child: Icon(Icons.add),
          );
        }
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: Text(
          "Students List",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Consumer<Registration>(
        builder: (context,value,child) {
          return ListView.builder(
            itemCount:value.studentModel.length,
            itemBuilder: (context, index) {

              return Container(height: 80,color: Colors.white,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(height: 80,
                      ),
                    ),
                    Column(
                      children: [
                        Text(value.studentModel[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                        Text(value.studentModel[index].phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      ],),
                    Row(
                      children: [
                        Consumer<Registration>(
                          builder: (context,value,child) {
                            return IconButton(
                                onPressed: (){
                              value.editData(value.studentModel[index].id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SavePage(from: 'EDIT',sId:value.studentModel[index].id ,)),
                              );


                              },
                                icon:Icon(Icons.edit));
                          }
                        ),
                        Consumer<Registration>(
                          builder: (context,value,child) {
                            return IconButton(onPressed: (){


                              provider.deleteData(value.studentModel[index].id,context);

                              }, icon:Icon(Icons.delete,),);
                          }
                        )
                      ],
                    ),
                  ],
                ),
              );
            },);
        }
      )
    );
  }
}


