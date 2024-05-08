import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/studentModel.dart';

class Registration with ChangeNotifier{
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  final DatabaseReference mRoot = FirebaseDatabase.instance.ref();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<StudentModel> studentModel=[];






  void deleteData( sId,BuildContext context){

   fb.collection("student").doc(sId).delete();
   ScaffoldMessenger.of(context ).showSnackBar(const SnackBar(
     content: Text("deleted successfully"),
     backgroundColor: Colors.teal,
   ));
   getStudentList();
   notifyListeners();
  }

void SaveFunction(String sId,String from){
  String Studentid =DateTime.now().millisecondsSinceEpoch.toString();
  HashMap<String,Object> map= HashMap();
  map["name"] = nameController.text.toString();
  map["phone"] = phoneController.text.toString();
  if(from=="NEW"){
    fb.collection("student").doc(Studentid ).set(map);
  }else{
    fb.collection("student").doc(sId ).update(map);
  }
  notifyListeners();
}
void getStudentList(){

  fb.collection("student").get().then((value ){
    print("abc");

  if (value.docs.isNotEmpty) {
    studentModel.clear();
    for(var element in value.docs){
      // print(element.get("name"));


        studentModel.add(StudentModel(element.id,element.get("name"),element.get("phone")));
        notifyListeners();


        print(studentModel.length.toString()+"xyz");
      }
  }

  });
}
  void editData(String id) {
    fb.collection('student').doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as  Map ;
        nameController.text = map['name'].toString();
        phoneController.text = map["phone"].toString();
        notifyListeners();
      }
    });
  }

// void getStudentDetails(String studentId){
//
//
//   fb.collection("student").doc(studentId).get().then((value) {
//
//     if(value.exists){
//
//     }
//
//
//
//
// });
//
//
// }
  void loginFunction(String from,String editid) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> loginMap = HashMap();
    loginMap["name"] = nameController.text;
    loginMap["phone"] = phoneController.text;
    loginMap["time"] = DateTime.now();
    loginMap["from"] = from;
    if (from == "add") {
      fb.collection("test").doc(id).set(loginMap);
    }
    else {
      fb.collection("test").doc(editid).set(loginMap);
    }

    //   fb.collection("test").doc(id).set({
    //     "name": nameController.text,
    //     "phone": phoneController.text
    //   });
    //   mRoot.child("test").child("name").update({"name":nameController.text});
    //   mRoot.child("test").child("phone").update({ "phone": phoneController.text});
    //   notifyListeners();
  }

  void clear(){
    nameController.clear();
    phoneController.clear();
  }

}







