// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Назад"),
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "create_an_account":
            MessageLookupByLibrary.simpleMessage("Создать учетную запись"),
        "don_t_you_have_an_account":
            MessageLookupByLibrary.simpleMessage("У вас нет аккаунта?"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "login_validator_message_1":
            MessageLookupByLibrary.simpleMessage("Логин не может быть пустым"),
        "login_validator_message_2": MessageLookupByLibrary.simpleMessage(
            "Пользователь с таким логином уже существует"),
        "or_sign_up_with":
            MessageLookupByLibrary.simpleMessage("Или войдите с помощью"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "password_validator_message_1":
            MessageLookupByLibrary.simpleMessage("Пароль не может быть пустым"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Войти"),
        "sign_in_to_continue":
            MessageLookupByLibrary.simpleMessage("Войдите чтобы продолжить"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать")
      };
}
