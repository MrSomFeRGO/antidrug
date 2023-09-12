import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
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
        onProgress: (progress) {
          setState(() {
            _loadingPercentage = progress;
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
