import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/app_theme.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/navigators.dart';
import '../../../core/utilities/validators.dart';
import '../components/confirm_dialog.dart';
import '../components/progress_dialog.dart';
import '../controller/profile_bloc.dart';

class ProfileEditPassword extends StatefulWidget {
  const ProfileEditPassword({Key? key}) : super(key: key);

  @override
  State<ProfileEditPassword> createState() => _ProfileEditPasswordState();
}

class _ProfileEditPasswordState extends State<ProfileEditPassword> {
  final _formKey = GlobalKey<FormState>();
  final oldPassCtrl = TextEditingController();
  final newPassCtrl = TextEditingController();
  final confirmNewPassCtrl = TextEditingController();

  @override
  void dispose() {
    oldPassCtrl.dispose();
    newPassCtrl.dispose();
    confirmNewPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل كلمة المرور",
          style: AppTheme.appbarTitleStyle(),
        ),
        centerTitle: true,
        actions: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is! UpdateUserPassState) return;
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
                    context.read<ProfileBloc>().add(UpdateUserPassword(
                        oldPass: oldPassCtrl.text, newPass: newPassCtrl.text));
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
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (_, c) => c is InvertPassHideState,
            builder: (context, state) {
              final bloc = context.read<ProfileBloc>();
              final bool showPass =
                  state is InvertPassHideState ? state.show : false;
              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: oldPassCtrl,
                    textInputAction: TextInputAction.next,
                    validator: passValidator,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: () => bloc.add(ShowHidePass(!showPass)),
                          child: Icon(
                            showPass ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.kComplementColor2,
                          )),
                      hintText: "كلمة المرور القديمة",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 2,
                      )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: newPassCtrl,
                    textInputAction: TextInputAction.next,
                    validator: passValidator,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: () => bloc.add(ShowHidePass(!showPass)),
                          child: Icon(
                            showPass ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.kComplementColor2,
                          )),
                      hintText: "كلمة المرور الجديدة",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmNewPassCtrl,
                    textInputAction: TextInputAction.done,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "الرجاء تأكيد كلمة المرور";
                      }
                      if (text != newPassCtrl.text) {
                        return "التأكيد لا يظابق كلمة المرور أعلاه";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: () => bloc.add(ShowHidePass(!showPass)),
                          child: Icon(
                            showPass ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.kComplementColor2,
                          )),
                      hintText: "تأكيد كلمة المرور الجديدة",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
