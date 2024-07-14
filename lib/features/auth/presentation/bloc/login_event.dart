part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class BrokerLoginEvent extends LoginEvent {}

final class BrokerSignUpDirectEvent extends LoginEvent {}

final class BrokerForgetPswEvent extends LoginEvent {}

final class TenantLoginEvent extends LoginEvent {}

final class TenantForgetPswEvent extends LoginEvent {}
