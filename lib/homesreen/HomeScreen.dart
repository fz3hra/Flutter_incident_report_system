import 'package:flutter/material.dart';
import 'package:incident_report_system/stepper/StepperPage.dart';
import 'package:incident_report_system/widget/AppBarWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Report Incident"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StepperPage()),
            );
          },
        ),
      ),
    );
  }
}
