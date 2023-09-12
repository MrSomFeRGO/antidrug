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
}
