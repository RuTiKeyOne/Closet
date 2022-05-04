import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/domain/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatModel extends ChangeNotifier {
  String _message;
  String get message => _message;
  set message(String val) => {
        _message = val,
        messageController.text = _message,
        messageController.selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length),
        ),
      };

  TextEditingController messageController;

  ChatModel(this._message, this.messageController);

  @override
  void cleanField() {
    _message = "";
    messageController.clear();
  }

  void backOnPressed(BuildContext context, ChatView state) {
    BlocProvider.of<ChatCubit>(context).emitFirstMessge(state);
    cleanField();
    Navigator.of(context).pop();
  }

  void sendMessage(BuildContext context, ChatView state) {
    if (message.isNotEmpty && message != "") {
      BlocProvider.of<ChatCubit>(context).emitNewMessage(
          state, Message(message: message, isUserMessage: true));
      cleanField();
    }
  }
}
