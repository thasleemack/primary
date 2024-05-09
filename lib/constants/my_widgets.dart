import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_colors.dart';

Widget Textformfield(String hintText,context,TextEditingController Contoller){
  var height= MediaQuery.of(context).size.height;
  var width= MediaQuery.of(context).size.width;
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
            controller:Contoller,
            cursorColor:Colors.grey,
            style: TextStyle(color:clblue),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText:hintText,
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

  );}

Widget Category(String text,context){
  var height= MediaQuery.of(context).size.height;
  var width= MediaQuery.of(context).size.width;
  return
    Container(
      height:50,
      width: width/2,
      decoration: BoxDecoration(
        color: clgreyblk,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Center(
        child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 19,color:Colors.amber.shade50),),
      ),
    );
}

Widget Eventtypes(String hintText,context,){
  var height= MediaQuery.of(context).size.height;
  var width= MediaQuery.of(context).size.width;
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
            // controller:Controller,
            cursorColor:Colors.grey,
            style: TextStyle(color:clblue),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText:hintText,
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

  );}