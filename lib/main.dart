import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/authorization/authorization_screen.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:closet/presentation/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        return MaterialApp(
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
          },
        );
      },
    );
  }
}