import 'package:flutter/material.dart';
import 'package:incident_report_system/widget/inputs.dart';
import 'package:intl/intl.dart';

class DatetimePicker extends StatefulWidget {
  @override
  _DatetimePickerState createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => this._selectDate(context),
            child: DateTimePickerTextField(
              enabled: false,
              textAlign: TextAlign.center,
              initialValue: DateFormat('dd-MMM-yyyy').format(this.selectedDate),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => this._selectTime(context),
            child: DateTimePickerTextField(
              enabled: false,
              textAlign: TextAlign.center,
              initialValue: DateFormat('HH:mm').format(selectedTime),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        this.selectedDate = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        var dt = this.selectedDate;
        this.selectedTime = new DateTime(
          dt.year,
          dt.month,
          dt.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }
}
