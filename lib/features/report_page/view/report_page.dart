import 'package:antidrugs/core/widgets/cusom_button.dart';
import 'package:antidrugs/features/report_page/bloc/report_page_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../../../core/widgets/custom_text_field.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  ScrollController sc = ScrollController();
  final _reportPageBloc = GetIt.I<ReportPageBloc>();

  @override
  void initState() {
    _phoneController = TextEditingController();
    _reportPageBloc.add(ReportPageSetInitial());
    super.initState();
  }

  late TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    Icon? icona;
    String? uriPostPath;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<ReportPageBloc, ReportPageState>(
        bloc: _reportPageBloc,
        builder: (context, state) {
          if (state is ReportPageUploadFailed) {
            icona = Icon(Icons.security_update_good, size: 56,);
            //TODO set icona
          }
          if (state is ReportPageUploadSuccess) {
            icona = Icon(Icons.mood_bad, size: 56,);
            //TODO set icona
          }
          if (state is ReportPageChosenFile) {
            uriPostPath = state.path;
            //TODO set icona
          }
          if (state is ReportPageUploading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              controller: sc,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: TextField(
                    controller: _phoneController,
                    maxLines: 10,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Report soseda',
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextButton(
                          theme: theme,
                          text: "Choose file",
                          onTap: () {
                            _reportPageBloc.add(ReportPageChooseFile());
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextButton(
                          theme: theme,
                          text: "Report",
                          onTap: () {
                            _reportPageBloc.add(UploadEvent(
                                _phoneController.text, uriPostPath ?? ""));
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    child: Text("Chosen file: " + ((uriPostPath) ?? " ")),
                    visible: (uriPostPath != null),
                  ),
                ),
                icona ?? Container(),
              ]),
            ),
          );
        },
      ),
    );
  }
}
