import 'package:antidrugs/features/auth/bloc/auth_bloc.dart';
import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/features/navigation/bloc/navigation_bloc.dart';
import 'package:antidrugs/features/navigation/bloc/snackbar_display_bloc.dart';
import 'package:antidrugs/repository/local/abstract_local_repository.dart';
import 'package:antidrugs/repository/local/impl/local_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _di = GetIt.instance;

Future<void> init() async {
  // vars

  // reg others
  // reg repositories
  _di.registerSingleton<AbstractLocalRepository>(
      LocalRepository(prefs: await SharedPreferences.getInstance()));

  // reg blocs
  // _di.registerLazySingleton(() => );
  _di.registerLazySingleton(() => AuthBloc());
  _di.registerLazySingleton(() => AppbarBloc());
  _di.registerLazySingleton(() => NavigationBloc());
  _di.registerLazySingleton(() => SnackbarDisplayBloc());
}
