import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/app_theme.dart';
import '../../../core/app_user.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/navigators.dart';
import '../../../core/utilities/validators.dart';
import '../components/confirm_dialog.dart';
import '../components/progress_dialog.dart';
import '../controller/profile_bloc.dart';

class ProfileEditEmail extends StatefulWidget {
  const ProfileEditEmail({Key? key}) : super(key: key);

  @override
  State<ProfileEditEmail> createState() => _ProfileEditEmailState();
}

class _ProfileEditEmailState extends State<ProfileEditEmail> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل البريد",
          style: AppTheme.appbarTitleStyle(),
        ),
        centerTitle: true,
        actions: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is! UpdateUserEmailState) return;
              if (state.processState == ProcessState.processing) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const ProgressDialog(),
                );
              } else {
                pagePop(); //pop dialog
                if (state.resultMessage.isNotEmpty) {
                  showMessage(state.resultMessage);
                }
                if (state.processState == ProcessState.done) {
                  pagePop(); //pop page
                }
              }
            },
            child: IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  final confirmed = await confirmDialog(context);
                  if (confirmed && context.mounted) {
                    context.read<ProfileBloc>().add(
                          UpdateUserEmail(
                            newEmail: emailCtrl.text,
                          ),
                        );
                  }
                }
              },
              icon: const Icon(Icons.done, size: 30),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "البريد الحالي",
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  appUser.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: emailValidator,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    hintText: "البريد الإلكتروني",
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
