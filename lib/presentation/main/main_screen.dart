import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/main_model.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return ChangeNotifierProvider(
      create: (context) => MainModel(getIt.get<ChatCubit>()),
      child: MainView(
        user: user,
      ),
    );
  }
}
