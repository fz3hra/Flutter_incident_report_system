import 'package:flutter/material.dart';
import 'package:incident_report_system/widget/AppBarWidget.dart';
import 'package:incident_report_system/widget/DatePicker.dart';
import 'package:incident_report_system/widget/Summary.dart';
import 'package:intl/intl.dart';

class StepperPage extends StatefulWidget {
  StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  // final dynamic _startDate = DateFormat('yyyy-MM-dd');
  // ignore: prefer_final_fields
  static dynamic _steps = [
    Step(title: Text("Severity"), content: _Severity()),
    Step(title: Text("What Happened"), content: _Occurance()),
    Step(
      title: Text("When did it occur?"),
      content: DatetimePicker(),
    ),
    Step(
      title: Text("Where did it happen?"),
      content: _OccuredIncident(),
    ),
    Step(
      title: Text("Incident Summary"),
      content: _Summary(),
    ),
  ];

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          title: 'Stepper',
        ),
      ),
      body: Stepper(
        // type: StepperType.horizontal,
        steps: _steps,
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          setState(() {
            if (_currentStep < _steps.length - 1) {
              _currentStep += 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            } else {
              _currentStep = 0;
            }
          });
        },
      ),
    );
  }
}

class _Severity extends StatelessWidget {
  const _Severity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
          )
        ],
      ),
      width: 250.0,
      height: 360.0,
      child: Column(
        children: [
          Container(
            width: 250.0,
            height: 90,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "High",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            width: 250.0,
            height: 90,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Medium",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            width: 250.0,
            height: 90,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Slight",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            width: 250.0,
            height: 90,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Normal",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Occurance extends StatelessWidget {
  const _Occurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("Fire"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Near Miss"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Accident"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("theft"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Property Damage"),
          ),
        ],
      ),
    );
  }
}

// ! add map here
class _OccuredIncident extends StatefulWidget {
  _OccuredIncident({Key? key}) : super(key: key);

  @override
  State<_OccuredIncident> createState() => __OccuredIncidentState();
}

class __OccuredIncidentState extends State<_OccuredIncident> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Summary extends StatelessWidget {
  const _Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 242.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SummaryDetails(
                leftInformation: "What Happened?",
                rightInformation: "Near miss",
              ),
              SummaryDetails(
                leftInformation: "Priority",
                rightInformation: "Medium",
              ),
              SummaryDetails(
                leftInformation: "Date",
                rightInformation: "April 5, 2019",
              ),
              SummaryDetails(
                leftInformation: "Region",
                rightInformation: "Port Louis",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
