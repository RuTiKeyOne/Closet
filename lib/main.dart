import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/BLoC/cubit/edit_cubit/edit_cubit.dart';
import 'package:closet/core/BLoC/cubit/new_order/new_order_cubit.dart';
import 'package:closet/core/BLoC/cubit/registration_cubit/registration_cubit.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/authorization/authorization_screen.dart';
import 'package:closet/presentation/chat/chat_screen.dart';
import 'package:closet/presentation/edit_profile/edit_profile_screen.dart';
import 'package:closet/presentation/main/main_screen.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:closet/presentation/new_order/new_order_screen.dart';
import 'package:closet/presentation/profile/profile_screen.dart';
import 'package:closet/presentation/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'presentation/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: light,
      dark: ThemeData.dark(),
      builder: (dark, light) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt.get<AuthorizationCubit>()),
            BlocProvider(create: (context) => getIt.get<RegistrationCubit>()),
            BlocProvider(create: (context) => getIt.get<EditCubit>()),
            BlocProvider(create: (context) => getIt.get<ChatCubit>()),
            BlocProvider(create: (context) => getIt.get<NewOrderCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: light,
            darkTheme: dark,
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: getIt.get<Authorization>().route,
            routes: {
              getIt.get<Authorization>().route: (context) =>
                  const AuthorizationScreen(),
              getIt.get<Registration>().route: (context) =>
                  const RegistrationScreen(),
              getIt.get<Main>().route: (context) => const MainScreen(),
              getIt.get<Profile>().route: (context) => const ProfileScreen(),
              getIt.get<EditProfile>().route: (context) =>
                  const EditProfileScreen(),
              getIt.get<Chat>().route: (context) => const ChatScreen(),
              getIt.get<NewOrder>().route: (context) => const NewOrderScreen()
            },
          ),
        );
      },
    );
  }
}
