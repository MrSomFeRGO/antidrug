import 'package:antidrugs/core/widgets/cusom_button.dart';
import 'package:antidrugs/features/report_page/bloc/report_page_bloc.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  ScrollController sc = ScrollController();
  final _reportPageBloc = GetIt.I<ReportPageBloc>();
  bool _isLoading = false;

  @override
  void initState() {
    _textController = TextEditingController();
    _reportPageBloc.add(ReportPageSetInitial());
    super.initState();
  }

  late TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    Icon? icona;
    String? uriPostPath;
    ThemeData theme = Theme.of(context);
    return Material(
      child: BlocProvider.value(
        value: _reportPageBloc,
        child: BlocListener<ReportPageBloc, ReportPageState>(
          listener: (context, state) {
            if (state is ReportPageUploadFailed) {
              icona = const Icon(
                Icons.security_update_good,
                size: 56,
              );
              //TODO set icona
            }
            if (state is ReportPageUploadSuccess) {
              icona = const Icon(
                Icons.mood_bad,
                size: 56,
              );
              //TODO set icona
            }
            if (state is ReportPageChosenFile) {
              uriPostPath = state.path;
              //TODO set icona
            }
            if (state is ReportPageUploading) {}
          },
          child: LoadingOverlay(
            color: ColorName.lightWhite,
            opacity: 0.5,
            isLoading: _isLoading,
            progressIndicator: CircularProgressIndicator(
              color: ColorName.blue.withOpacity(0.75),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: SingleChildScrollView(
                controller: sc,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextField(
                        controller: _textController,
                        maxLines: 10,
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Кратко опишите ситуацию',
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomTextButton(
                              theme: theme,
                              text: "Выберите фото",
                              onTap: () {
                                _reportPageBloc.add(ReportPageChooseFile());
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomTextButton(
                              theme: theme,
                              text: "Отправить донос",
                              onTap: () {
                                _reportPageBloc.add(UploadEvent(
                                    _textController.text, uriPostPath ?? ""));
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: (uriPostPath != null),
                        child: Text("Тесты: " + ((uriPostPath) ?? " ")),
                      ),
                    ),
                    icona ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
