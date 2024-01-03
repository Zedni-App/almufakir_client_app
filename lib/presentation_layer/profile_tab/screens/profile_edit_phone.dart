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

class ProfileEditPhone extends StatefulWidget {
  const ProfileEditPhone({Key? key}) : super(key: key);

  @override
  State<ProfileEditPhone> createState() => _ProfileEditPhoneState();
}

class _ProfileEditPhoneState extends State<ProfileEditPhone> {
  final _formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();

  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل رقم الهاتف",
          style: AppTheme.appbarTitleStyle(),
        ),
        centerTitle: true,
        actions: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is! UpdateUserPhoneState) return;
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
                          UpdateUserPhone(
                            newPhone: phoneCtrl.text,
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
                  "الرقم الحالي",
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  appUser.phone,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: phoneValidator,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: "رقم الموبايل",
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
