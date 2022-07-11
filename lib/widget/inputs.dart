import 'package:flutter/material.dart';

class DateTimePickerTextField extends StatelessWidget {
  final TextInputType? inputType;
  final String? label;
  final String? initialValue;
  final bool? enabled;
  final TextAlign? textAlign;
  final String? prefixText;
  final String? suffixText;
  final int? maxLines;

  DateTimePickerTextField({
    this.inputType,
    this.label,
    this.initialValue,
    this.enabled,
    this.textAlign,
    this.prefixText,
    this.suffixText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    controller.text = initialValue ?? '';
    var underlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(
      width: 1,
    ));
    return Container(
      height: 40,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        enabled: this.enabled,
        textAlign: this.textAlign ?? TextAlign.start,
        maxLines: this.maxLines ?? 1,
        decoration: InputDecoration(
          prefixText: this.prefixText,
          suffixText: this.suffixText,
          labelText: this.label ?? '',
          disabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
          enabledBorder: underlineInputBorder,
          contentPadding: EdgeInsets.only(bottom: 10.0),
        ),
      ),
    );
  }
}
