// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'Providers/registration.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//     return Scaffold(
//       backgroundColor: Colors.purple.shade100,
//       appBar: AppBar(
//         backgroundColor: Colors.purple.shade200,
//         title: const Center(child: Text("Login",style: TextStyle(color: Colors.white),)),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Consumer<Registration>(
//             builder: (context2,value2,child) {
//               return TextField(controller: value2.nameController,
//
//                 decoration: const InputDecoration(
//                   hintText: "name",
//                   hintStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               );
//             }
//           ),
//     Consumer<Registration>(
//     builder: (context3,value3,child) {
//       return TextField(controller: value3.phoneController,
//                 decoration: const InputDecoration(
//                   hintText: "phone",
//                   hintStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               );
//             }
//           ),
//           const SizedBox(height: 30),
//           Consumer<Registration>(
//             builder: (context1,value7,child) {
//               return Row(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       value7.loginFunction("add","");
//                     },
//                     child: const Text(
//                       "add",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       value7.loginFunction("edit","1694603336287");
//                     },
//                     child: const Text(
//                       "edit",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           ),
//         ],
//       ),
//     );
//   }
// }
