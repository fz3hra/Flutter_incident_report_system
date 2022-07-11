import 'package:flutter/material.dart';

class SummaryDetails extends StatelessWidget {
  String? leftInformation;
  String? rightInformation;
  SummaryDetails({
    Key? key,
    required this.leftInformation,
    required this.rightInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftInformation!),
          Text(rightInformation!),
        ],
      ),
    );
  }
}
