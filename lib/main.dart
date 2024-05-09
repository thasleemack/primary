import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:primary/Providers/login_provider.dart';
import 'package:primary/Providers/main_provider.dart';
import 'package:primary/screens/admins/admin_home_screen.dart';

import 'package:primary/screens/splash_screen.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
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
           ChangeNotifierProvider(create: (context)=>AdminProvider()),
           ChangeNotifierProvider(create: (context)=>LoginProvider()),
         ],
         child: MaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'Flutter Demo',
           theme: ThemeData(
             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
             useMaterial3: true,
           ),
           home: Splash(),
         ),
       );
  }
}

