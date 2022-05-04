part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatView extends ChatState {
  late List<Message>? messages;

  ChatView({
    this.messages,
  }) {
    messages ??= [];
  }

  ChatView copyWith({
    List<Message>? messages,
  }) {
    return ChatView(
      messages: messages ?? this.messages,
    );
  }

  @override
  bool operator ==(Object other) {
    return false;
  }
}
