import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Providers/main_provider.dart';
import '../../constants/my_colors.dart';
import '../../constants/my_functions.dart';
import '../../constants/my_texts.dart';
import '../../constants/my_widgets.dart';
import '../admins/users_list_screen.dart';
import '../login_screen.dart';


class Registration extends StatelessWidget {
  String from;
  String Id;
   Registration({super.key,required this.from,required this.Id});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clDADADA,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showBottomSheet(context);

                },
                child: Consumer<AdminProvider>(
                  builder: (context,value,child) {
                    return value.customerFile!=null?CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey,
                      backgroundImage: FileImage(value.customerFile!),

                      ):value.imgUrl!=""?CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(value.imgUrl),

                    ):CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey,
                     child: Icon(Icons.add_a_photo_outlined),

                    );

                  }
                ),
              ),
              SizedBox(height:20,),
              Consumer<AdminProvider>(
                  builder: (context,value,child) {
                    return Textformfield('Name',context,value.nameController);
                  }
              ),
              SizedBox(height: 10,),
              Consumer<AdminProvider>(
                  builder: (context1,value,child) {
                    return Textformfield('Phone',context,value.phoneController);
                  }
              ),
              SizedBox(height: 10,),
              Consumer<AdminProvider>(
                  builder: (context2,value,child) {
                    return Textformfield('Address',context,value.addressController);
                  }
              ),
              SizedBox(height: 10,),

              Consumer<AdminProvider>(
                  builder: (context1,value,child) {
                    return GestureDetector(
                      onTap: (){
                        if(from=="NEW"){
                          value.addCustomer("NEW","");
                          callNext(LoginPage(), context);
                        }else{
                          value.addCustomer("EDIT",Id);
                          callNext(Customerlist(), context);
                        }
                        },
                      child: Container(
                        height: 53,
                        width: width/2,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(42),color: clBlue),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: clWhite,
                              fontFamily: fontRegular,
                              fontSize: textSize16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(from=="NEW"?"Already have account?":"",style: TextStyle(
                      fontWeight: FontWeight.normal,fontSize: 12,color:clblue),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text(from=="NEW"?"Log in":"Update",style: TextStyle(
                      fontWeight: FontWeight.normal,fontSize:12,color:clblue,),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void showBottomSheet(BuildContext context) {
  AdminProvider provider = Provider.of<AdminProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: clBlue,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: clBlue),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
}