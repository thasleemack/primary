import 'package:flutter/material.dart';
import 'package:primary/screens/admins/event_screen.dart';

import 'package:provider/provider.dart';



import '../../Providers/main_provider.dart';
import '../../constants/my_colors.dart';
import '../../constants/my_functions.dart';
import '../../constants/my_texts.dart';


class Addnewevent extends StatelessWidget {
  String from;
  String id;
  Addnewevent({super.key,required this.from,required this.id});

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
              back(context);
            },
            child: Icon(Icons.arrow_back,color: clWhite,size: 20,)),
        title: Text(
          'Add New Event',
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Consumer<AdminProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: (){
                          showBottomSheet(context);
                        },
                        child: value.EventfileImg !=null
                            ?Container(
                          height: 100,
                          width: width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),
                          child: Image.file(value.EventfileImg! ,fit: BoxFit.fill,),

                        ):value.eventUrl!=""?Container(
                          height: 100,
                          width: width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),
                          child: Image.network(value.eventUrl ,fit: BoxFit.fill,),

                        ):

                        value.EventImgs!= ""?
                        Container(
                          height: 100,
                          width: width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),
                          child: Image.network(value.EventImgs! ,fit: BoxFit.fill,),

                        ):

                        Container(
                          height: 100,
                          width: width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),

                          child: Center(
                            child: Text(
                              'Image',
                              style: TextStyle(
                                color: clWhite,
                                fontFamily: fontRegular,
                                fontSize: textSize25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 10,),
              Consumer<AdminProvider>(
                  builder: (context,value,child) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:clBlack),
                          borderRadius: BorderRadius.circular(22),
                          color: clDADADA
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.only(left:10,top: 10),
                            child: TextField(
                              controller:value.EventNameController,
                              cursorColor:Colors.grey,
                              style: TextStyle(color:clblue),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                hintText:'Event Name',
                                prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                                focusedBorder:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(22),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    );
                  }
              ),
              SizedBox(height: 10,),
              Consumer<AdminProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: (){
                        if(from=="NEW"){
                          value.AddEvent("NEW","");
                        }else{
                          value.AddEvent("EDIT",id);
                        }

                        callNext(Eventsscreen(),context, );
                      },
                      child: Center(
                        child: Container(
                          height: 45,
                          width: width/3,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(42),color: clgradient2),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: clBlue,
                                fontFamily: fontRegular,
                                fontSize: textSize16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
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
                  color: Colors.amber.shade50,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getLogocamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Colors.amber.shade50,
                ),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getLogogallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}