import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/BLoC/cubit/edit_cubit/edit_cubit.dart';
import 'package:closet/core/BLoC/cubit/new_order/new_order_cubit.dart';
import 'package:closet/core/BLoC/cubit/registration_cubit/registration_cubit.dart';
import 'package:closet/core/data/db/user_db_impl.dart';
import 'package:closet/core/data/repository/db_repository_impl.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/repository/db_repository.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<Authorization>(() => Authorization());
  getIt.registerLazySingleton<Registration>(() => Registration());
  getIt.registerLazySingleton<Main>(() => Main());
  getIt.registerLazySingleton<Profile>(() => Profile());
  getIt.registerLazySingleton<EditProfile>(() => EditProfile());
  getIt.registerLazySingleton<Chat>(() => Chat());
  getIt.registerLazySingleton<NewOrder>(() => NewOrder());
  getIt.registerLazySingleton<Orders>(() => Orders());

  getIt
      .registerLazySingleton<UserDatabaseImpl>(() => UserDatabaseImpl.instance);
  getIt.registerLazySingleton<DbRepository>(
      () => DbRepositoryImpl(userDb: getIt.get<UserDatabaseImpl>()));
  getIt.registerLazySingleton<DbController>(() => DbController());

  getIt.registerSingleton<AuthorizationCubit>(AuthorizationCubit(
      getIt.get<DbController>(),
      AuthorizationView(await getIt.get<DbController>().getUsers())));
  getIt.registerSingleton<EditCubit>(EditCubit(
      controller: getIt.get<DbController>(),
      initialState: EditView(await getIt.get<DbController>().getUsers())));
  getIt.registerSingleton<RegistrationCubit>(RegistrationCubit(
    authorizationCubit: getIt.get<AuthorizationCubit>(),
    editCubit: getIt.get<EditCubit>(),
    controller: getIt.get<DbController>(),
    initialState: RegistrationView(await getIt.get<DbController>().getUsers()),
  ));
  getIt.registerSingleton<ChatCubit>(ChatCubit(ChatView()));
  getIt.registerSingleton<NewOrderCubit>(NewOrderCubit(NewOrderView()));
}

Future<void> precachePictures() async {
  await Future.wait([
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/account.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/order.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/chat.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/location.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/phone.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/login.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/password.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/email.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/edit.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/box.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/support_chat.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoderBuilder, 'assets/icons/new_order.svg'),
      null,
    ),
  ]);
}
