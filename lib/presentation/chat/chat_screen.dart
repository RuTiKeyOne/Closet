import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart' as cubit;
import 'package:closet/core/inherit/chat_model.dart';
import 'package:closet/presentation/chat/chart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cubit.ChatCubit, cubit.ChatState>(
      builder: (context, state) {
        if (state is cubit.ChatView) {
          return ChangeNotifierProvider(
            create: (context) => ChatModel("", TextEditingController(text: "")),
            child: ChatView(
              state: state,
            ),
          );
        }
        return Container();
      },
    );
  }
}
