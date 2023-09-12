import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/gen/assets.gen.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    GetIt.I<AppbarBloc>().add(const AppbarAddTitle(title: 'Профилактика'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorName.lightWhite,
      child: ListView(
        children: [
          const Divider(),
          Assets.png.second.image(height: 220),
          const Divider(),
          Assets.png.first.image(height: 220),
          const Divider(),
          Assets.png.thrid.image(height: 220),
        ],
      ),
    );
  }
}
