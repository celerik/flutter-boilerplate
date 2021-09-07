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

  /// `My app`
  String get title {
    return Intl.message(
      'My app',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Second screen view`
  String get second_screen {
    return Intl.message(
      'Second screen view',
      name: 'second_screen',
      desc: '',
      args: [],
    );
  }

  /// `skyp`
  String get skyp {
    return Intl.message(
      'skyp',
      name: 'skyp',
      desc: '',
      args: [],
    );
  }

  /// `terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Go to second screen`
  String get go_second_screen {
    return Intl.message(
      'Go to second screen',
      name: 'go_second_screen',
      desc: '',
      args: [],
    );
  }

  /// `Increment`
  String get increment {
    return Intl.message(
      'Increment',
      name: 'increment',
      desc: '',
      args: [],
    );
  }

  /// `Flutter baseline`
  String get login_message {
    return Intl.message(
      'Flutter baseline',
      name: 'login_message',
      desc: '',
      args: [],
    );
  }

  /// `A code verification was sent to your email`
  String get sign_up_success {
    return Intl.message(
      'A code verification was sent to your email',
      name: 'sign_up_success',
      desc: '',
      args: [],
    );
  }

  /// `The code was resent`
  String get code_sent {
    return Intl.message(
      'The code was resent',
      name: 'code_sent',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Flutter baseline`
  String get sign_up_title {
    return Intl.message(
      'Flutter baseline',
      name: 'sign_up_title',
      desc: '',
      args: [],
    );
  }

  /// `Value Cannot Be Empty`
  String get empty_value {
    return Intl.message(
      'Value Cannot Be Empty',
      name: 'empty_value',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
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

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email {
    return Intl.message(
      'Email address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Login.`
  String get already_account {
    return Intl.message(
      'Already have an account? Login.',
      name: 'already_account',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get verify_email {
    return Intl.message(
      'Verify your email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
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

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account? Sign up.`
  String get do_not_have_account {
    return Intl.message(
      'Do not have an account? Sign up.',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Your email has been verified`
  String get verify_confirm {
    return Intl.message(
      'Your email has been verified',
      name: 'verify_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code that was sent to your email to verify your identify`
  String get verify_text {
    return Intl.message(
      'Enter the 6-digit code that was sent to your email to verify your identify',
      name: 'verify_text',
      desc: '',
      args: [],
    );
  }

  /// `Upload a profile photo`
  String get upload_photo {
    return Intl.message(
      'Upload a profile photo',
      name: 'upload_photo',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address`
  String get valid_email_regex {
    return Intl.message(
      'Please enter valid email address',
      name: 'valid_email_regex',
      desc: '',
      args: [],
    );
  }

  /// `You do not have internet connection`
  String get no_internet {
    return Intl.message(
      'You do not have internet connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Recover password`
  String get recover_password {
    return Intl.message(
      'Recover password',
      name: 'recover_password',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get send_code {
    return Intl.message(
      'Send code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `The password was changed successfully`
  String get password_changed {
    return Intl.message(
      'The password was changed successfully',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `You must complete all the fields`
  String get fields_required {
    return Intl.message(
      'You must complete all the fields',
      name: 'fields_required',
      desc: '',
      args: [],
    );
  }

  /// `The passwords must be the same`
  String get password_must_be_same {
    return Intl.message(
      'The passwords must be the same',
      name: 'password_must_be_same',
      desc: '',
      args: [],
    );
  }

  /// `{error}`
  String error_api_respose(Object error) {
    return Intl.message(
      '$error',
      name: 'error_api_respose',
      desc: '',
      args: [error],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
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
