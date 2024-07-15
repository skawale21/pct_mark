part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class BrokerLoginFailureState extends LoginState {}

final class TenantLoginFailureState extends LoginState {}

// action states
final class LoginActionState extends LoginState {}

final class BrokerLoginSuccessActionState extends LoginActionState {}

final class TenantLoginSuccessActionState extends LoginActionState {}

final class BrokerSignupActionState extends LoginActionState {}

final class BrokerForgotPswActionState extends LoginActionState {}

final class TenantForgotPswActionState extends LoginActionState {}
