part of 'report_page_bloc.dart';

abstract class ReportPageState extends Equatable {
  const ReportPageState();
}

class ReportPageInitial extends ReportPageState {
  @override
  List<Object> get props => [];
}

class ReportPageUploading extends ReportPageState {
  @override
  List<Object> get props => [];
}

class ReportPageUploadSuccess extends ReportPageState {
  @override
  List<Object> get props => [];
}

class ReportPageUploadFailed extends ReportPageState {
  @override
  List<Object> get props => [];
}

class ReportPageChoseFile extends ReportPageState {
  @override
  List<Object> get props => [];
}

class ReportPageChosenFile extends ReportPageState {
  ReportPageChosenFile(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
