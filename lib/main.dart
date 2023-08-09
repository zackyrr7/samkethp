import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samekt/screen/login.dart';
import 'package:samekt/screen/register.dart';

import 'package:samekt/theme.dart';
import 'package:samekt/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String id = '';
    _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
      print (id);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadid();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        if (id == '') {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sampah Market",
          //defaul size = 360,690
          theme: buildThemeData(),
          home: const LoginScreen(),
        );
        } else{
return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sampah Market",
          //defaul size = 360,690
          theme: buildThemeData(),
          home: const Navbar(),
        );
        }
        
      },
    );
  }
}
