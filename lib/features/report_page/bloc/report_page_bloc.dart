import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

part 'report_page_event.dart';

part 'report_page_state.dart';

class ReportPageBloc extends Bloc<ReportPageEvent, ReportPageState> {
  ReportPageBloc() : super(ReportPageInitial()) {
    on<UploadEvent>((event, emit) => _uploadEvent(event, emit));
    on<ReportPageSetInitial>(
        (event, emit) => _reportPageSetInitial(event, emit));
    on<ReportPageChooseFile>(
        (event, emit) => _reportPageChooseFile(event, emit));
  }

  _uploadEvent(ReportPageEvent event, Emitter<ReportPageState> emit) async {
    emit.call(ReportPageUploading());

    // TODO аплоадим хуету

    bool isUploadWasSuccess = true;
    //TODO initalize above

    if (isUploadWasSuccess) {
      emit.call(ReportPageUploadSuccess());
      return;
    } else {
      emit.call(ReportPageUploadFailed());
      return;
    }
  }

  _reportPageSetInitial(
      ReportPageEvent event, Emitter<ReportPageState> emit) async {
    emit.call(ReportPageInitial());
  }

  _reportPageChooseFile(
      ReportPageEvent event, Emitter<ReportPageState> emit) async {
    emit.call(ReportPageChoseFile());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      //type: FileType.custom,
      //allowedExtensions: ['jpg', 'jpeg'],
    );
    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      emit.call(ReportPageChosenFile(fileName));
    } else {
      emit.call(ReportPageInitial());
    }
  }
}
