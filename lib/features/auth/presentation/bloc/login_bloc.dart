import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/features/auth/domain/entities/broker_login_entity.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BrokerLogin _brokerLogin;
  final TenantLogin _tenantLogin;
  LoginBloc(
      {required BrokerLogin brokerLogin, required TenantLogin tenantLogin})
      : _brokerLogin = brokerLogin,
        _tenantLogin = tenantLogin,
        super(LoginInitial()) {
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
      BrokerLoginEvent event, Emitter<LoginState> emit) async {
    final user = await _brokerLogin(
        BrokerLoginParams(userName: event.userName, password: event.password));

    user.fold(
      (l) {
        debugPrint(l.message);
        emit(BrokerLoginFailureState(message: l.message));
      },
      (brokerLoginEntity) {
        emit(BrokerLoginSuccessActionState(
            brokerLoginEntity: brokerLoginEntity));
      },
    );
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
