// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to Continue`
  String get sign_in_to_continue {
    return Intl.message(
      'Sign in to Continue',
      name: 'sign_in_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Don't you have an account?`
  String get don_t_you_have_an_account {
    return Intl.message(
      'Don\'t you have an account?',
      name: 'don_t_you_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get or_sign_up_with {
    return Intl.message(
      'Or sign up with',
      name: 'or_sign_up_with',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `The login cannot be empty.`
  String get login_validator_message_1 {
    return Intl.message(
      'The login cannot be empty.',
      name: 'login_validator_message_1',
      desc: '',
      args: [],
    );
  }

  /// `A user with this username already exists.`
  String get login_validator_message_2 {
    return Intl.message(
      'A user with this username already exists.',
      name: 'login_validator_message_2',
      desc: '',
      args: [],
    );
  }

  /// `The password cannot be empty.`
  String get password_validator_message_1 {
    return Intl.message(
      'The password cannot be empty.',
      name: 'password_validator_message_1',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_an_account {
    return Intl.message(
      'Create an account',
      name: 'create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login or password is incorrect.`
  String get login_or_password_is_incorrect {
    return Intl.message(
      'Login or password is incorrect.',
      name: 'login_or_password_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `A user with this login already exists.`
  String get login_validator_message_3 {
    return Intl.message(
      'A user with this login already exists.',
      name: 'login_validator_message_3',
      desc: '',
      args: [],
    );
  }

  /// `Closet`
  String get closet {
    return Intl.message(
      'Closet',
      name: 'closet',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_1 {
    return Intl.message(
      'New',
      name: 'new_1',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Telephone`
  String get telephone {
    return Intl.message(
      'Telephone',
      name: 'telephone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `The email cannot be empty.`
  String get email_validator_message_1 {
    return Intl.message(
      'The email cannot be empty.',
      name: 'email_validator_message_1',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct email value.`
  String get email_validator_message_2 {
    return Intl.message(
      'Enter the correct email value.',
      name: 'email_validator_message_2',
      desc: '',
      args: [],
    );
  }

  /// `The telephone cannot be empty.`
  String get telephone_validator_message_1 {
    return Intl.message(
      'The telephone cannot be empty.',
      name: 'telephone_validator_message_1',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct phone number.`
  String get telephone_validator_message_2 {
    return Intl.message(
      'Enter the correct phone number.',
      name: 'telephone_validator_message_2',
      desc: '',
      args: [],
    );
  }

  /// `Support chat`
  String get support_chat {
    return Intl.message(
      'Support chat',
      name: 'support_chat',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon, you can ask your questions here.`
  String get welcome_message {
    return Intl.message(
      'Good afternoon, you can ask your questions here.',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `New order`
  String get new_order {
    return Intl.message(
      'New order',
      name: 'new_order',
      desc: '',
      args: [],
    );
  }

  /// `To order`
  String get to_order {
    return Intl.message(
      'To order',
      name: 'to_order',
      desc: '',
      args: [],
    );
  }

  /// `Tariff`
  String get tariff {
    return Intl.message(
      'Tariff',
      name: 'tariff',
      desc: '',
      args: [],
    );
  }

  /// `Base`
  String get base {
    return Intl.message(
      'Base',
      name: 'base',
      desc: '',
      args: [],
    );
  }

  /// `Warehouse`
  String get warehouse {
    return Intl.message(
      'Warehouse',
      name: 'warehouse',
      desc: '',
      args: [],
    );
  }

  /// `Container`
  String get container {
    return Intl.message(
      'Container',
      name: 'container',
      desc: '',
      args: [],
    );
  }

  /// `Box`
  String get box {
    return Intl.message(
      'Box',
      name: 'box',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `m^2`
  String get m_2 {
    return Intl.message(
      'm^2',
      name: 'm_2',
      desc: '',
      args: [],
    );
  }

  /// `Rental\nperiod`
  String get rental_period {
    return Intl.message(
      'Rental\nperiod',
      name: 'rental_period',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Type\nof delivery\nto the\nwarehouse`
  String get type_of_delivery_to_the_warehouse {
    return Intl.message(
      'Type\nof delivery\nto the\nwarehouse',
      name: 'type_of_delivery_to_the_warehouse',
      desc: '',
      args: [],
    );
  }

  /// `Delivery to the warehouse`
  String get delivery_to_the_warehouse {
    return Intl.message(
      'Delivery to the warehouse',
      name: 'delivery_to_the_warehouse',
      desc: '',
      args: [],
    );
  }

  /// `Add contract`
  String get add_contract {
    return Intl.message(
      'Add contract',
      name: 'add_contract',
      desc: '',
      args: [],
    );
  }

  /// `By yourself`
  String get by_yourself {
    return Intl.message(
      'By yourself',
      name: 'by_yourself',
      desc: '',
      args: [],
    );
  }

  /// `Staff`
  String get staff {
    return Intl.message(
      'Staff',
      name: 'staff',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `rub.`
  String get rub {
    return Intl.message(
      'rub.',
      name: 'rub',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Things In Stock`
  String get things_in_stock {
    return Intl.message(
      'Things In Stock',
      name: 'things_in_stock',
      desc: '',
      args: [],
    );
  }

  /// `Things are not stock`
  String get things_are_not_in_stock {
    return Intl.message(
      'Things are not stock',
      name: 'things_are_not_in_stock',
      desc: '',
      args: [],
    );
  }

  /// `The order has been placed`
  String get the_order_has_been_placed {
    return Intl.message(
      'The order has been placed',
      name: 'the_order_has_been_placed',
      desc: '',
      args: [],
    );
  }

  /// `Order completed`
  String get order_completed {
    return Intl.message(
      'Order completed',
      name: 'order_completed',
      desc: '',
      args: [],
    );
  }

  /// `What is included`
  String get what_is_included {
    return Intl.message(
      'What is included',
      name: 'what_is_included',
      desc: '',
      args: [],
    );
  }

  /// `Box rental`
  String get box_rental {
    return Intl.message(
      'Box rental',
      name: 'box_rental',
      desc: '',
      args: [],
    );
  }

  /// `Castle`
  String get castle {
    return Intl.message(
      'Castle',
      name: 'castle',
      desc: '',
      args: [],
    );
  }

  /// `Seal`
  String get seal {
    return Intl.message(
      'Seal',
      name: 'seal',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Video surveillance`
  String get video_surveillance {
    return Intl.message(
      'Video surveillance',
      name: 'video_surveillance',
      desc: '',
      args: [],
    );
  }

  /// `Access to boxing 24/7`
  String get access_to_boxing_24_7 {
    return Intl.message(
      'Access to boxing 24/7',
      name: 'access_to_boxing_24_7',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Open box`
  String get open_box {
    return Intl.message(
      'Open box',
      name: 'open_box',
      desc: '',
      args: [],
    );
  }

  /// `Change status`
  String get change_status {
    return Intl.message(
      'Change status',
      name: 'change_status',
      desc: '',
      args: [],
    );
  }

  /// `Contract`
  String get contract {
    return Intl.message(
      'Contract',
      name: 'contract',
      desc: '',
      args: [],
    );
  }

  /// `QR code`
  String get qr_code {
    return Intl.message(
      'QR code',
      name: 'qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Bring the QR code to the box`
  String get bring_the_qr_code_to_the_box {
    return Intl.message(
      'Bring the QR code to the box',
      name: 'bring_the_qr_code_to_the_box',
      desc: '',
      args: [],
    );
  }

  /// `Example QR code`
  String get example_qr_code {
    return Intl.message(
      'Example QR code',
      name: 'example_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Camera 1`
  String get camera_1 {
    return Intl.message(
      'Camera 1',
      name: 'camera_1',
      desc: '',
      args: [],
    );
  }

  /// `Camera 2`
  String get camera_2 {
    return Intl.message(
      'Camera 2',
      name: 'camera_2',
      desc: '',
      args: [],
    );
  }

  /// `Chat order`
  String get chat_order {
    return Intl.message(
      'Chat order',
      name: 'chat_order',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
