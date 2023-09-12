import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Provider/Dataprovider.dart';
import 'Routes/app_page_routes.dart';
import 'Routes/app_routes.dart';
import 'UI/ManagementDashboard/Menupage.dart';
import 'loginpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider<DataProvider>(
      create: (_) => DataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo.shade900,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nadi',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Loginpage(),
      //Menupage(),
      //DashBoard(),
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
    );
    // return MaterialApp(

    //Menupage());
    //Monthlyreport());
    //Annualreport());
    //Managementscreen());
    // dashbord
    // ExampleApp());
    // MyHomePage());
    Loginpage();
  }
}
