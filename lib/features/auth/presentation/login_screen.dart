import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/common/common_functions/form_validations.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';
import 'package:pct_mark/core/common/resources/theme_manager.dart';
import 'package:pct_mark/core/common/resources/values_manager.dart';
import 'package:pct_mark/core/common/widgets/app_logo_widget.dart';
import 'package:pct_mark/core/common/widgets/auth_form_field_widget.dart';
import 'package:pct_mark/core/common/widgets/background_scaffold_widget.dart';
import 'package:pct_mark/core/common/widgets/custom_elevated_button_widget.dart';
import 'package:pct_mark/core/common/widgets/custom_snackbar.dart';
import 'package:pct_mark/core/common/widgets/loading_widget.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _loginTabController;
  // final LoginBloc _loginBloc = LoginBloc();

  @override
  void initState() {
    _loginTabController = TabController(length: 2, vsync: this);
    _loginTabController.index = 0;
    super.initState();
  }

  @override
  void dispose() {
    _loginTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<LoginBloc>();
    return BackgroundScaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listenWhen: (previous, current) => current is LoginActionState,
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (BrokerLoginSuccessActionState):
              showCustomSnackbar(context, 'BrokerLoginSuccessActionState');
              break;
            case const (TenantLoginSuccessActionState):
              showCustomSnackbar(context, 'TenantLoginSuccessActionState');

              break;
            case const (BrokerSignupActionState):
              showCustomSnackbar(context, 'BrokerSignupActionState');

              break;
            case const (BrokerForgotPswActionState):
              showCustomSnackbar(context, 'BrokerForgotPswActionState');

              break;
            case const (TenantForgotPswActionState):
              showCustomSnackbar(context, 'TenantForgotPswActionState');

              break;
            default:
              showCustomSnackbar(context, 'BrokerLoginDefaultActionState');
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (LoginLoadingState):
              return const LoadingWidget();
            default:
              return Center(
                // Center the entire content within BackgroundScaffold
                child: SingleChildScrollView(
                  // Allow content to scroll if needed
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: PctMargin.m16),
                    // Add padding for visual balance (optional)

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center column vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center column horizontally
                      children: [
                        appLogoTitle, // Assuming appLogoTitle is a centered widget
                        // Add other login screen elements here, centered within the column
                        Card(
                          color: PctColors.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(PctAppSize.s10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: PctMargin.m10, vertical: 00),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                TabBar(
                                    controller: _loginTabController,
                                    tabs: const [
                                      Tab(
                                        child: Text(
                                          PctStrings.LoginScreenBrokerTitle,
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          PctStrings.LoginScreenTenantTitle,
                                        ),
                                      )
                                    ]),
                                const Image(
                                  height: 150,
                                  image: AssetImage(
                                    PctImages.mansitting,
                                  ),
                                ),
                                const Text(
                                  PctStrings.SignIn,
                                  style: PctTextStyles.sigiInTextStyle,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 350,
                                  child: TabBarView(
                                      controller: _loginTabController,
                                      children: const [
                                        BrokerLoginTab(),
                                        TenantLoginTab()
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class BrokerLoginTab extends StatefulWidget {
  const BrokerLoginTab({super.key});

  @override
  State<BrokerLoginTab> createState() => _BrokerLoginTabState();
}

class _BrokerLoginTabState extends State<BrokerLoginTab> {
  final TextEditingController _brokerUserName = TextEditingController();
  final TextEditingController _brokerPassword = TextEditingController();
  bool? rememberMe = false;
  final _brokerLoginFormfield = GlobalKey<FormState>();

  @override
  void dispose() {
    _brokerUserName.dispose();
    _brokerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.all(PctAppSize.s10),
      child: Column(
        children: [
          Form(
            key: _brokerLoginFormfield,
            child: Column(
              children: [
                AuthField(
                  hintText: 'Username (Email/Mob No)',
                  controller: _brokerUserName,
                  validator: (value) => validateEmailOrPhone(value, 'Username'),
                ),
                AuthField(
                  hintText: 'Password',
                  controller: _brokerPassword,
                  isObscure: true,
                  showToggle: true,
                  validator: (value) => validatePassword(value, 'Password'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue!;
                    });
                  },
                ),
                const Text(
                  PctStrings.LoginScreenRememberMeTitle,
                  style: PctTextStyles.remMeFogotPsw,
                ),
              ]),
              InkWell(
                onTap: () {
                  loginBloc.add(BrokerForgetPswEvent());
                },
                child: const Text(
                  PctStrings.LoginScreenForgetPasswordTitle,
                  style: PctTextStyles.remMeFogotPsw,
                ),
              )
            ],
          ),
          CustomElevatedButton(
            onPressed: () {
              if (_brokerLoginFormfield.currentState!.validate()) {
                loginBloc.add(BrokerLoginEvent(
                  password: _brokerPassword.text.trim(),
                  userName: _brokerUserName.text.trim(),
                ));
              }
            },
            text: 'LOG IN',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                PctStrings.LoginScreenNoAccountTitle,
                style: PctTextStyles.loginScreenNoAccountTitleStyle,
              ),
              InkWell(
                onTap: () {
                  loginBloc.add(BrokerSignUpDirectEvent());
                  // context.pushNamed(AppRoutes.signupRoute);
                },
                child: const Text(
                  PctStrings.LoginScreenSingnUpTitle,
                  style: PctTextStyles.remMeFogotPsw,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TenantLoginTab extends StatefulWidget {
  const TenantLoginTab({super.key});

  @override
  State<TenantLoginTab> createState() => _TenantLoginTabState();
}

class _TenantLoginTabState extends State<TenantLoginTab> {
  final TextEditingController _tenantUserName = TextEditingController();
  final TextEditingController _tenantPassword = TextEditingController();
  bool? rememberMe = false;
  final _tenantLoginFormfield = GlobalKey<FormState>();

  @override
  void dispose() {
    _tenantUserName.dispose();
    _tenantPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.all(PctAppSize.s10),
      child: Column(
        children: [
          Form(
            key: _tenantLoginFormfield,
            child: Column(
              children: [
                AuthField(
                  hintText: 'Username (Email/Mob No)',
                  controller: _tenantUserName,
                  validator: (value) => validateEmailOrPhone(value, 'Username'),
                ),
                AuthField(
                  hintText: 'Password',
                  controller: _tenantPassword,
                  isObscure: true,
                  showToggle: true,
                  validator: (value) => validatePassword(value, 'Password'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue!;
                    });
                  },
                ),
                const Text(
                  PctStrings.LoginScreenRememberMeTitle,
                  style: PctTextStyles.remMeFogotPsw,
                ),
              ]),
              InkWell(
                onTap: () {
                  loginBloc.add(TenantForgetPswEvent());
                },
                child: const Text(
                  PctStrings.LoginScreenForgetPasswordTitle,
                  style: PctTextStyles.remMeFogotPsw,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomElevatedButton(
            onPressed: () {
              if (_tenantLoginFormfield.currentState!.validate()) {
                loginBloc.add(TenantLoginEvent(
                  password: _tenantPassword.text.trim(),
                  userName: _tenantUserName.text.trim(),
                ));
                if (kDebugMode) {
                  print('Form is valid');
                }
              }
            },
            text: 'LOG IN',
          )
        ],
      ),
    );
  }
}
