import 'package:flutter/material.dart';
import 'package:incident_report_system/homesreen/HomeScreen.dart';
import 'package:incident_report_system/widget/AppBarWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(
            title: 'Incident Report System',
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
