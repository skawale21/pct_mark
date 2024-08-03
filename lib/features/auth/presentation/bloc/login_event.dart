part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class BrokerLoginEvent extends LoginEvent {
  final String userName;
  final String password;
  final bool rememberMe;

  BrokerLoginEvent(
      {required this.userName,
      required this.password,
      required this.rememberMe});
}

final class BrokerSignUpDirectEvent extends LoginEvent {}

final class BrokerForgetPswEvent extends LoginEvent {}

final class TenantLoginEvent extends LoginEvent {
  final String userName;
  final String password;
  final bool rememberMe;

  TenantLoginEvent(
      {required this.userName,
      required this.password,
      required this.rememberMe});
}

final class TenantForgetPswEvent extends LoginEvent {}
