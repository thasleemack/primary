import 'package:flutter/material.dart';
import 'package:primary/Providers/registration.dart';
import 'package:primary/crud.dart';
import 'package:provider/provider.dart';

class SavePage extends StatelessWidget {
  String from;
  String sId;
   SavePage({super.key,required this.from,required this.sId});


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,title: Text("Add Student"),),
      backgroundColor: Colors.teal.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width:350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal.shade700,
              ),
              child: Consumer<Registration>(

                builder: (context6,value5,child) {
                  return TextField(controller: value5.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "name",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width:350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal.shade700,
              ),
              child: Consumer<Registration>(
                builder: (context4,value4,child) {
                  return TextField(controller: value4.phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "phone",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Consumer<Registration>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: () {
                    print("code here");
                    if (from == "NEW") {
                      value.SaveFunction('', 'NEW');
                    } else {
                      value.SaveFunction(sId, 'EDIT');
                    }
                    ScaffoldMessenger.of(context ).showSnackBar( SnackBar(
                      content: Text("edit data successfully"),
                      backgroundColor: Colors.teal,
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      Crud()),
                    );

                  },

                  child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade700,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
