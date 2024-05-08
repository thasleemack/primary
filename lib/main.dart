import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:primary/Providers/registration.dart';

import 'package:provider/provider.dart';

import 'crud.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    // options: const FirebaseOptions(apiKey: "AIzaSyCfUNGpqr9qxg_7zPQA486NGGId3AtC3WY",
    //     authDomain: "primary-project-cb886.firebaseapp.com",
    //     databaseURL: "https://primary-project-cb886-default-rtdb.firebaseio.com",
    //     projectId: "primary-project-cb886",
    //     storageBucket: "primary-project-cb886.appspot.com",
    //     messagingSenderId: "242992432478",
    //     appId: "1:242992432478:web:07011b080b10c03a90fbcf",
    //     measurementId: "G-E3TM527NF5")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return
       MultiProvider(
         providers: [
           ChangeNotifierProvider(create: (context)=>Registration()),
         ],
         child: MaterialApp(debugShowCheckedModeBanner: false,
           title: 'Flutter Demo',



             theme: ThemeData(
             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
             useMaterial3: true,
           ),
           home: Crud(),
         ),
       );
  }
}

