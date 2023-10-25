import 'package:admin/pages/panel.dart';
import 'package:admin/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: 'AIzaSyB5OXV5DYXzQUP_Ufp72ny3WA7YLMfk0j8', appId: "1:296926526317:android:e0934fc84f808914fab864", messagingSenderId: '296926526317', projectId: 'stuevents-80fc3')
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData){
              return MaterialApp(home:AdminPanel(),debugShowCheckedModeBanner: false,);
            }
            else{
              return MaterialApp(home:adminSign(),debugShowCheckedModeBanner: false,);
            }
          }),
    );
  }
}

