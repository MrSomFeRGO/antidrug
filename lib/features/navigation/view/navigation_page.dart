import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/core/widgets/snackbar_messages.dart';
import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/features/navigation/bloc/navigation_bloc.dart';
import 'package:antidrugs/features/navigation/bloc/snackbar_display_bloc.dart';
import 'package:antidrugs/features/navigation/widgets/custom_appbar.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key, required this.screen}) : super(key: key);
  final Widget screen;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _appbarBloc = GetIt.I<AppbarBloc>();
  final _snackbarDisplayBloc = GetIt.I<SnackbarDisplayBloc>();

  _snackbarDisplayBlocListener(
      BuildContext context, SnackbarDisplayState state) {
    if (state is SnackbarDisplayError) {
      showErrorMessage(title: state.title, desc: state.desc, context: context);
    } else if (state is SnackbarDisplayWarning) {
      showWarningMessage(
          title: state.title, desc: state.desc, context: context);
    } else if (state is SnackbarDisplaySuccess) {
      showSuccessMessage(
          title: state.title, desc: state.desc, context: context);
    } else if (state is SnackbarDisplayInfo) {
      showInfoMessage(title: state.title, desc: state.desc, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: BlocBuilder<AppbarBloc, AppbarState>(
              bloc: _appbarBloc,
              builder: (context, state) {
                return setAppBar(context, state.titles.last);
              },
            ),
          ),
          body: BlocListener<SnackbarDisplayBloc, SnackbarDisplayState>(
            bloc: _snackbarDisplayBloc,
            listener: (context, state) =>
                _snackbarDisplayBlocListener(context, state),
            child: widget.screen,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.black.withOpacity(0.3),
              width: 0.5,
            ))),
            child: BottomNavigationBar(
              onTap: (value) {
                if (state.index != value) {
                  context.read<NavigationBloc>().add(ChangePageEvent(value));
                  context.go(navigationTabs[value].initialLocation);
                }
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              backgroundColor: ColorName.lightWhite,
              unselectedItemColor: const Color(0xff999999),
              selectedItemColor: const Color(0xff3F75FF),
              items: navigationTabs,
              currentIndex: state.index,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        );
      },
    );
  }
}
