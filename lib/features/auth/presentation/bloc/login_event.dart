part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class BrokerLoginEvent extends LoginEvent {
  final String userName;
  final String password;

  BrokerLoginEvent({required this.userName, required this.password});
}

final class BrokerSignUpDirectEvent extends LoginEvent {}

final class BrokerForgetPswEvent extends LoginEvent {}

final class TenantLoginEvent extends LoginEvent {
  final String userName;
  final String password;

  TenantLoginEvent({required this.userName, required this.password});
}

final class TenantForgetPswEvent extends LoginEvent {}
