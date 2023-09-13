import 'dart:async';
import 'dart:ui';

import 'package:antidrugs/features/reports_list/dto/donosObj.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'certain_report_event.dart';
part 'certain_report_state.dart';

class CertainReportBloc extends Bloc<CertainReportEvent, CertainReportState> {
  CertainReportBloc() : super(CertainReportInitial()) {
    on<CertainReportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
