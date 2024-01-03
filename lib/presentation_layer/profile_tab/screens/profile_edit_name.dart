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

class ProfileEditName extends StatefulWidget {
  const ProfileEditName({Key? key}) : super(key: key);

  @override
  State<ProfileEditName> createState() => _ProfileEditNameState();
}

class _ProfileEditNameState extends State<ProfileEditName> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController(text: appUser.fName);
  final nickCtrl = TextEditingController(text: appUser.lName);

  @override
  void dispose() {
    nameCtrl.dispose();
    nickCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل الإسم",
          style: AppTheme.appbarTitleStyle(),
        ),
        centerTitle: true,
        actions: [
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is! UpdateUserNameState) return;
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
                    context.read<ProfileBloc>().add(UpdateUserName(
                        newName: nameCtrl.text, newNick: nickCtrl.text));
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
          child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
              const SizedBox(height: 10),
          TextFormField(
            controller: nameCtrl,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: nameValidator,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "الإسم الأول",

            ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: nickCtrl,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          validator: nameValidator,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            hintText: "الاسم الثاني",
          ),
        ),
        const SizedBox(height: 10),
        const Text("هذا الإسم سيظهر لأساتذتك ولزملائك بالتطبيق..")
        ],
      ),
    ),)
    ,
    );
  }
}
