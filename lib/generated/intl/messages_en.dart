// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "create_an_account":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "don_t_you_have_an_account":
            MessageLookupByLibrary.simpleMessage("Don\'t you have an account?"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_validator_message_1":
            MessageLookupByLibrary.simpleMessage("The login cannot be empty"),
        "login_validator_message_2": MessageLookupByLibrary.simpleMessage(
            "A user with this username already exists"),
        "or_sign_up_with":
            MessageLookupByLibrary.simpleMessage("Or sign up with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_validator_message_1": MessageLookupByLibrary.simpleMessage(
            "The password cannot be empty"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
        "sign_in_to_continue":
            MessageLookupByLibrary.simpleMessage("Sign in to Continue"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
