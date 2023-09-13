part of 'certain_report_bloc.dart';

abstract class CertainReportState extends Equatable {
  const CertainReportState();
}

class CertainReportInitial extends CertainReportState {
  @override
  List<Object> get props => [];
}

class CertainReportHasData extends CertainReportState {
  @override
  final DonosObj donos;

  CertainReportHasData(this.donos);

  List<Object> get props => [];
}

class CertainReportDataLost extends CertainReportState {
  @override
  List<Object> get props => [];
}

class CertainReportDataLoading extends CertainReportState {
  @override
  List<Object> get props => [];
}
