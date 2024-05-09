import 'dart:collection';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/my_functions.dart';
import '../models/studentModel.dart';

class AdminProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");

  ///Add Customers

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? customerFile;
  void addCustomer(String from, String nId) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> customerMap = HashMap();
    HashMap<String, Object> userMap = HashMap();
    if(from=="NEW"){
      customerMap["ID"] = id;
    }
    customerMap["NAME"] = nameController.text;
    customerMap["PHONE_NUMBER"] = phoneController.text;
    customerMap["ADDRESS"] = addressController.text;
    if (customerFile != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(customerFile!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          customerMap["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
    }
    // else if(userImgUrl!=""){
    //   customerMap["PHOTO"] = userImgUrl;
    // }
    else {
      customerMap['PHOTO'] = "";
    }

    userMap["NAME"] = nameController.text;
    userMap["PHONE_NUMBER"] = "+91${phoneController.text}";
    userMap["TYPE"] = "USER";
    if(from=="NEW"){
      db.collection("CUSTOMERS").doc(id).set(customerMap);
      db.collection("USERS").doc(id).set(userMap);
      notifyListeners();
    }else{
      db.collection("CUSTOMERS").doc(nId).update(customerMap);
      db.collection("USERS").doc(nId).update(userMap);
      notifyListeners();
    }
    // getCustomers();
    notifyListeners();
  }

  ///Image selection and crop Function for Customers

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile != null) {
        customerFile = File(croppedFile.path);
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      print('Error cropping image: $e');
    }
  }
  /// get users
  List<UserModel> customersList =[];
  void getCustomers(){
    db.collection("CUSTOMERS").get().then((value){
      if (value.docs.isNotEmpty) {
        customersList.clear();
        for (var value in value.docs) {
          customersList.add(UserModel(
            value.id,
            value.get("NAME").toString(),
            value.get("PHONE_NUMBER").toString(),
            value.get("ADDRESS").toString(),
            value.get("PHOTO").toString(),
          ));
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }
  ///to get edit data from users
  String imgUrl ="";
  void getCustomerEdit(cId){
    db.collection("CUSTOMERS").doc(cId).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        nameController.text= map["NAME"].toString();
        phoneController.text= map["PHONE_NUMBER"].toString();
        addressController.text= map["ADDRESS"].toString();
        imgUrl =map["PHOTO"].toString();
        notifyListeners();
      }
      notifyListeners();
    });
  }



  ///delete Customers
  void deleteCustomer(wId, context) {
    db.collection("CUSTOMERS").doc(wId).delete();
    db.collection("USERS").doc(wId).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Deleted",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          
        ),
      ),

    ));
    getCustomers();
    finish(context);
    notifyListeners();
  }
  ///Add New Event

  TextEditingController EventNameController = TextEditingController();

  File? EventfileImg;
  String EventImgs="";
  String LogoImg="";
  Future<void> AddEvent(String from,String id) async {
    String eventid = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String,Object> map = HashMap();
    print('helloooooooooooooooo');
    map['EVENT_NAME'] = EventNameController.text;

    map['TIME'] = DateTime.now();
    if(from=="NEW") {
      map['EVENT_ID'] = eventid;

    }
    print('frfndfjdkfnvajknf');
    if ( EventfileImg!= null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(EventfileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["EVENT_IMAGE"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['EVENT_IMAGE'] = "";

    }
    if(from=="NEW"){
      db.collection('ADD_EVENTS').doc(eventid).set(map);
      notifyListeners();
    }else{
      db.collection('ADD_EVENTS').doc(id).update(map);
      notifyListeners();
    }

    getEvent();
    notifyListeners();
  }

  Future getLogogallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropBrandLogo(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getLogocamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropBrandLogo(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropBrandLogo(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      EventfileImg = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }

  ///fetch events

  List<EventModel> eventList=[];
  void getEvent() {
    db.collection("ADD_EVENTS").get().then((value) {
      if (value.docs.isNotEmpty) {
        eventList.clear();
        for (var value in value.docs) {
          eventList.add(EventModel(
            value.id,
            value.get("EVENT_NAME").toString(),
            value.get("EVENT_IMAGE").toString(),
          ));
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }
  /// get edit data
String eventUrl="";
 void editData(eId){
   db.collection("ADD_EVENTS").doc(eId).get().then((value) {
     if(value.exists){
       Map<dynamic, dynamic> map = value.data() as Map;
       EventNameController.text = map["EVENT_NAME"].toString();
       eventUrl= map["EVENT_IMAGE"].toString();
       notifyListeners();
     }
     notifyListeners();
   });

 }
 void deleteEvent(eId,context){
   db.collection("ADD_EVENTS").doc(eId).delete();
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     content: Text(
       "Deleted",
       style: TextStyle(
         fontSize: 16,
         color: Colors.white,

       ),
     ),

   ));
   getEvent();
   finish(context);
   notifyListeners();
 }
}