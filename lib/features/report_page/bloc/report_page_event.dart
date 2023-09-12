part of 'report_page_bloc.dart';

abstract class ReportPageEvent extends Equatable {
  const ReportPageEvent();
}

class UploadEvent extends ReportPageEvent {
  final String path;
  final String text;

  const UploadEvent(
    this.path,
    this.text,
  );

  @override
  List<Object?> get props => [];
}

class ReportPageSetInitial extends ReportPageEvent {
  @override
  List<Object?> get props => [];
}

class ReportPageChooseFile extends ReportPageEvent {
  @override
  List<Object?> get props => [];
}
