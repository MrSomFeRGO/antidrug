import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MotivationPage extends StatefulWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  late final WebViewController _controller;
  var _loadingPercentage = 0;

  @override
  void initState() {
    GetIt.I<AppbarBloc>().add(const AppbarAddTitle(title: 'Профилактика'));
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            _loadingPercentage = 0;
          });
        },
        onPageFinished: (url) {
          setState(() {
            _loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  void dispose() {
    _controller.loadRequest(Uri.parse('about:blank'));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: ColorName.lightWhite,
      opacity: 0.5,
      isLoading: _loadingPercentage < 100,
      progressIndicator: CircularProgressIndicator(
        color: ColorName.blue.withOpacity(0.75),
      ),
      child: Material(
        color: ColorName.lightWhite,
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
