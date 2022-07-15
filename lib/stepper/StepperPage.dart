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
  // ignore: prefer_final_fields
  int _currentStep = 0;
  dynamic selectDate = DateTime.now();
  dynamic selectTime;
  TextEditingController regionController = new TextEditingController();
  String testt = '';
  bool isCompleted = false;

  // ignore: prefer_final_fields
  List<Step> _steps() => [
        Step(
          isActive: _currentStep >= 0,
          title: Text("Severity"),
          content: _Severity(),
        ),
        Step(
          isActive: _currentStep >= 1,
          title: Text("What Happened"),
          content: Occurance(
            testing: (test) {
              testt = test;
            },
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: Text("When did it occur?"),
          content: DatetimePicker(
            selectDate: (val) {
              selectDate = val;
            },
            selectTime: (timeVal) {
              selectTime = timeVal;
            },
          ),
        ),
        Step(
          isActive: _currentStep >= 3,
          title: Text("Where did it happen?"),
          content: _OccuredIncident(
            region: (region) {
              regionController = region;
            },
          ),
        ),
        Step(
          isActive: _currentStep >= 4,
          title: Text("Incident Summary"),
          content: _Summary(
            regionController: regionController,
            dateOccurred: selectDate,
            testTwo: selectTime,
            test: testt,
          ),
        ),
      ];

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
      body: isCompleted
          ? Container(
              child: Center(
                child: Text("Sent to Server"),
              ),
            )
          : Stepper(
              controlsBuilder: (context, controls) {
                final isLastStep = _currentStep == _steps().length - 1;
                return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                        onPressed: controls.onStepContinue,
                      )),
                      const SizedBox(width: 12),
                      if (_currentStep != 0)
                        Expanded(
                            child: ElevatedButton(
                          child: Text('Back'),
                          onPressed: controls.onStepCancel,
                        )),
                    ],
                  ),
                );
              },
              // type: StepperType.horizontal,
              steps: _steps(),
              currentStep: _currentStep,
              onStepTapped: (step) => setState(() => _currentStep = step),
              onStepContinue: () {
                final isLastStep = _currentStep == _steps().length - 1;
                if (isLastStep) {
                  setState(() {
                    isCompleted = true;
                  });
                  print('Completed');
                  // send data to server
                } else {
                  setState(() {
                    if (_currentStep < _steps().length - 1) {
                      _currentStep += 1;
                    } else {
                      _currentStep = 0;
                    }
                  });
                }
              },
              onStepCancel: _currentStep == 0
                  ? null
                  : () => setState(() {
                        if (_currentStep > 0) {
                          _currentStep -= 1;
                        } else {
                          _currentStep = 0;
                        }
                      }),
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
          InkWell(
            onTap: () {
              print("ink");
            },
            child: Container(
              width: 250.0,
              height: 90,
              child: Center(
                  child: Text('High',
                      style: TextStyle(
                        color: Colors.black,
                      ))),
            ),
          ),
          InkWell(
            onTap: () {
              print("2");
            },
            child: Container(
              width: 250.0,
              height: 90,
              child: Center(
                child: Text(
                  "Medium",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 250.0,
              height: 90,
              child: Center(
                child: Text(
                  "Slight",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 250.0,
              height: 90,
              child: Center(
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

class Occurance extends StatefulWidget {
  Function(dynamic) testing;
  Occurance({
    Key? key,
    required this.testing,
  }) : super(key: key);

  @override
  State<Occurance> createState() => OccuranceState();
}

class OccuranceState extends State<Occurance> {
  dynamic test;
  var fire = "Fire";
  var NearMiss = "Near Miss";
  var Accident = "Accident";
  var theft = "theft";
  var PropertyDamage = "Property Damage";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                test = fire;
                this.widget.testing(test);
              });
            },
            child: Text(fire),
          ),
          TextButton(
            onPressed: () {
              test = NearMiss;
              this.widget.testing(test);
            },
            child: Text(NearMiss),
          ),
          TextButton(
            onPressed: () {
              test = Accident;
              this.widget.testing(test);
            },
            child: Text(Accident),
          ),
          TextButton(
            onPressed: () {
              test = theft;
              this.widget.testing(test);
            },
            child: Text(theft),
          ),
          TextButton(
            onPressed: () {
              test = PropertyDamage;
              this.widget.testing(test);
            },
            child: Text(PropertyDamage),
          ),
        ],
      ),
    );
  }
}

// ! add map here
class _OccuredIncident extends StatefulWidget {
  Function(dynamic) region;
  _OccuredIncident({
    Key? key,
    required this.region,
  }) : super(key: key);

  @override
  State<_OccuredIncident> createState() => __OccuredIncidentState();
}

class __OccuredIncidentState extends State<_OccuredIncident> {
  TextEditingController regionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(regionController.text);
    return Container(
      margin: EdgeInsets.all(16),
      child: TextField(
        controller: regionController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Region',
        ),
        onChanged: (text) {
          setState(() {
            this.widget.region(regionController);
          });
        },
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  final dynamic dateOccurred;
  final dynamic testTwo;
  final dynamic regionController;
  final dynamic test;
  _Summary({
    Key? key,
    this.dateOccurred,
    required this.testTwo,
    required this.regionController,
    required this.test,
  }) : super(key: key);

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
                rightInformation: test,
              ),
              SummaryDetails(
                leftInformation: "Priority",
                rightInformation: "Medium",
              ),
              SummaryDetails(
                leftInformation: "Date",
                rightInformation: DateFormat('yyyy-MM-dd').format(dateOccurred),
              ),
              SummaryDetails(
                leftInformation: "Region",
                rightInformation: regionController.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
