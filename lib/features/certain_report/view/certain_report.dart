import 'package:antidrugs/features/certain_report/bloc/certain_report_bloc.dart';
import 'package:antidrugs/features/reports_list/dto/donosObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CertainReport extends StatefulWidget {
  const CertainReport({Key? key}) : super(key: key);

  @override
  State<CertainReport> createState() => _CertainReportState();
}

class _CertainReportState extends State<CertainReport> {
  DonosObj donos = DonosObj("text", "imgUrl", "userId", 40, 40);

  Padding CR_Divider() {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(), // Image
        ),
        CR_Divider(),
        Text(donos.userId.toString()), //State id,
        CR_Divider(),
        Text(donos.text.toString()), // state text
        CR_Divider(),
        // TODO MAP INTEGRATE
      ],
    );
  }
}
