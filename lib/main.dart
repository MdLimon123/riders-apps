import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riders_app/view/Splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'firebase_options.dart';
import 'global/global_vars.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission){
    if(valueOfPermission){
      Permission.locationWhenInUse.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
