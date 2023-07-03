import 'package:flutter/material.dart';
import 'package:flutter_application_2/dbHelper/mongodb.dart';
import 'package:get/get.dart';

import 'Login/signin_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIDS ONLINE',
      home: SignInPage(),
      // home: PickVideoPhoto(),
    );
  }
}
