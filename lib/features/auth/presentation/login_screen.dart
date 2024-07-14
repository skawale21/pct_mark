import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/asset_manager.dart';
import 'package:pct_mark/core/common/resources/string_manager.dart';
import 'package:pct_mark/core/common/resources/theme_manager.dart';
import 'package:pct_mark/core/common/resources/values_manager.dart';
import 'package:pct_mark/core/common/widgets/app_logo_widget.dart';
import 'package:pct_mark/core/common/widgets/auth_form_field_widget.dart';
import 'package:pct_mark/core/common/widgets/background_scaffold_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _loginTabController;

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
    return BackgroundScaffold(
      body: Center(
        // Center the entire content within BackgroundScaffold
        child: SingleChildScrollView(
          // Allow content to scroll if needed
          child: Padding(
            // Add padding for visual balance (optional)
            padding: const EdgeInsets.symmetric(horizontal: PctPadding.p18),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center column vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center column horizontally
              children: [
                appLogoTitle, // Assuming appLogoTitle is a centered widget
                // Add other login screen elements here, centered within the column
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(PctAppSize.s20)),
                  margin: const EdgeInsets.symmetric(
                      horizontal: PctAppSize.s20, vertical: 00),
                  child: Container(
                    child: Column(
                      children: [
                        TabBar(controller: _loginTabController, tabs: const [
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
                          height: 250,
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
  final _brokerSignupFormfield = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PctAppSize.s20),
      child: Column(
        children: [
          Form(
              key: _brokerSignupFormfield,
              child: Column(
                children: [
                  AuthField(
                    hintText: 'Mobile No/Email Id',
                    controller: _brokerUserName,
                  ),
                  AuthField(
                    hintText: 'Password',
                    controller: _brokerPassword,
                    isObsecure: false,
                  ),
                ],
              )),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          children: [TextFormField()],
        )),
      ],
    );
  }
}
