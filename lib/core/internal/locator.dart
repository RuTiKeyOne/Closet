import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/BLoC/cubit/registration_cubit/registration_cubit.dart';
import 'package:closet/core/data/db/user_db_impl.dart';
import 'package:closet/core/data/repository/db_repository_impl.dart';
import 'package:closet/core/domain/repository/db_repository.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<Authorization>(() => Authorization());
  getIt.registerLazySingleton<Registration>(() => Registration());
  getIt.registerLazySingleton<Main>(() => Main());

  getIt
      .registerLazySingleton<UserDatabaseImpl>(() => UserDatabaseImpl.instance);
  getIt.registerLazySingleton<DbRepository>(
      () => DbRepositoryImpl(userDb: getIt.get<UserDatabaseImpl>()));
  getIt.registerLazySingleton<DbController>(() => DbController());

  getIt.registerSingleton<AuthorizationCubit>(
      AuthorizationCubit(getIt.get<DbController>(), AuthorizationInitial())
        ..emitAthorizationView());
  getIt.registerSingleton<RegistrationCubit>(RegistrationCubit(
    cubit: getIt.get<AuthorizationCubit>(),
    controller: getIt.get<DbController>(),
    initialState: RegistrationInitial(),
  )..emitRegistrationView());
}
