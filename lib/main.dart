import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/services/auth_services.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase . initializeApp (
    options : DefaultFirebaseOptions . currentPlatform ,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthService>(
          create:(_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: "APP",
        home:AuthWrapper()
      ),
    );
  }
}
class AuthWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final user = context.watch<User?>();
   if(user != null){
     return Homepage();
   }else {
     return LoginPage();
   }
  }
}