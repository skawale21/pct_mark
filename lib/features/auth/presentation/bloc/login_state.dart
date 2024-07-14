part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class BrokerLoginFailureState extends LoginState {}

final class TenantLoginFailureState extends LoginState {}

// action states
final class LoginActionState extends LoginState {}

final class BrokerLoginSuccessState extends LoginActionState {}

final class TenantLoginSuccessState extends LoginActionState {}
