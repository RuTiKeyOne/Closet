import 'package:bloc/bloc.dart';
import 'package:closet/core/domain/model/message.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(ChatState initialState) : super(initialState);

  void emitNewMessage(ChatView state, Message message) {
    List<Message> updatedMessages = state.messages ?? [];
    updatedMessages.add(message);
    emit(state.copyWith(messages: updatedMessages));
  }

  void emitFirstMessge(ChatView state) {
    List<Message> updatedMessages = state.messages ?? [];
    updatedMessages.clear();
    emit(state.copyWith(messages: updatedMessages));
  }
}
