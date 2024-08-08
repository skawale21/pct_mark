import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';
import 'package:pct_mark/core/common/resources/values_manager.dart';
import 'package:pct_mark/core/common/widgets/custom_button.dart';
import 'package:pct_mark/core/common/widgets/custom_snackbar.dart';
import 'package:pct_mark/features/tenant_features/help_screen/presentation/bloc/edit_complaint_bloc.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController compDescTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _complaintFormKey = GlobalKey<FormState>();

  void onChangeValidate() {
    if (_complaintFormKey.currentState!.validate()) {
      // Do something if valid
    }
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a comment';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    EditComplaintBloc editComplaintBloc = context.read<EditComplaintBloc>();

    return BlocConsumer<EditComplaintBloc, EditComplaintState>(
      bloc: editComplaintBloc,
      listenWhen: (previous, current) => current is EditComplaintActionState,
      buildWhen: (previous, current) => current is! EditComplaintActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HELP & SUPPORT'),
            ),
            body: BlocConsumer<EditComplaintBloc, EditComplaintState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case const (EditComplaintErrorActionState):
                    showCustomSnackbar(
                        context, 'EditComplaintErrorActionState');

                    break;
                  case const (EditComplaintSuccessActionState):
                    showCustomSnackbar(
                        context, 'EditComplaintSuccessActionState');
                    break;
                  default:
                    showCustomSnackbar(
                        context, 'NewComplaintDefaultActionState');
                }
              },
              builder: (context, state) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "COMMENT",
                          style: TextStyle(
                            fontSize: PctAppSize.s16,
                            fontWeight: FontWeight.bold,
                            color: PctColors.blackColor,
                          ),
                        ),
                        Form(
                          key: _complaintFormKey,
                          child: TextFormField(
                            controller: compDescTextEditingController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onChanged: (value) {
                              onChangeValidate();
                            },
                            validator: inputValidator,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          title: 'Send',
                          onButtonPress: () {
                            if (_complaintFormKey.currentState!.validate()) {
                              editComplaintBloc.add(
                                  const EditComplaintSendButtonClickEvent(
                                      complaintDesc: 'complaintDesc'));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
