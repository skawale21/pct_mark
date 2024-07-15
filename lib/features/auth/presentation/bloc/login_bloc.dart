import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(loginEvent);
    on<BrokerLoginEvent>(brokerLoginEvent);
    on<BrokerSignUpDirectEvent>(brokerSignUpDirectEvent);
    on<BrokerForgetPswEvent>(brokerForgetPswEvent);
    on<TenantLoginEvent>(tenantLoginEvent);
    on<TenantForgetPswEvent>(tenantForgetPswEvent);
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
  }

  FutureOr<void> brokerLoginEvent(
      BrokerLoginEvent event, Emitter<LoginState> emit) {
    emit(BrokerLoginSuccessActionState());
  }

  FutureOr<void> brokerSignUpDirectEvent(
      BrokerSignUpDirectEvent event, Emitter<LoginState> emit) {
    emit(BrokerSignupActionState());
  }

  FutureOr<void> brokerForgetPswEvent(
      BrokerForgetPswEvent event, Emitter<LoginState> emit) {
    emit(BrokerForgotPswActionState());
  }

  FutureOr<void> tenantLoginEvent(
      TenantLoginEvent event, Emitter<LoginState> emit) {
    emit(TenantLoginSuccessActionState());
  }

  FutureOr<void> tenantForgetPswEvent(
      TenantForgetPswEvent event, Emitter<LoginState> emit) {
    emit(TenantForgotPswActionState());
  }
}
