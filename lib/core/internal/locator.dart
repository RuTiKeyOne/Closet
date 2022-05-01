import 'package:closet/presentation/navigation/route.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<Authorization>(() => Authorization());
  getIt.registerLazySingleton<Registration>(() => Registration());
}
