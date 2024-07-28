import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/common/common_functions/shared_prefs.dart';
import 'package:pct_mark/core/common/definations.dart';
import 'package:pct_mark/features/auth/domain/entities/broker_login_entity.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/broker_login.dart';
import 'package:pct_mark/features/auth/domain/repository/usecase/tenant_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BrokerLogin _brokerLogin;
  final TenantLogin _tenantLogin;

  LoginBloc({
    required BrokerLogin brokerLogin,
    required TenantLogin tenantLogin,
  })  : _brokerLogin = brokerLogin,
        _tenantLogin = tenantLogin,
        super(LoginInitial()) {
    on<LoginEvent>(loginEvent);
    on<BrokerLoginEvent>(brokerLoginEvent);
    on<BrokerSignUpDirectEvent>(brokerSignUpDirectEvent);
    on<BrokerForgetPswEvent>(brokerForgetPswEvent);
    on<TenantLoginEvent>(tenantLoginEvent);
    on<TenantForgetPswEvent>(tenantForgetPswEvent);
  }

  Future<void> loginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
  }

  Future<void> brokerLoginEvent(
      BrokerLoginEvent event, Emitter<LoginState> emit) async {
    final user = await _brokerLogin(
        BrokerLoginParams(userName: event.userName, password: event.password));

    await user.fold(
      (l) {
        debugPrint(l.message);
        emit(BrokerLoginFailureState(message: l.message));
      },
      (user) async {
        await saveUserData(userType: UserType.broker, token: user.token);

        emit(BrokerLoginSuccessActionState(brokerLoginEntity: user));
      },
    );
  }

  Future<void> brokerSignUpDirectEvent(
      BrokerSignUpDirectEvent event, Emitter<LoginState> emit) async {
    emit(BrokerSignupActionState());
  }

  Future<void> brokerForgetPswEvent(
      BrokerForgetPswEvent event, Emitter<LoginState> emit) async {
    emit(BrokerForgotPswActionState());
  }

  Future<void> tenantLoginEvent(
      TenantLoginEvent event, Emitter<LoginState> emit) async {
    emit(TenantLoginSuccessActionState());
  }

  Future<void> tenantForgetPswEvent(
      TenantForgetPswEvent event, Emitter<LoginState> emit) async {
    emit(TenantForgotPswActionState());
  }
}
