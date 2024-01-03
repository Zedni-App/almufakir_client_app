import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/app_theme.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/navigators.dart';
import '../../../core/utilities/validators.dart';
import '../../../domain_layer/entities/user_entity.dart';
import '../components/logo_image.dart';
import '../controller/login_bloc.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailCtrl = TextEditingController();
  final fNameCtrl = TextEditingController();
  final lNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    fNameCtrl.dispose();
    lNameCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lprimarycolor5,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const LogoImage(),
            fName(),
            SizedBox(height: percentHeight(0.020)),
            lName(),
            SizedBox(height: percentHeight(0.020)),
            email(),
            SizedBox(height: percentHeight(0.020)),
            pass(),
            SizedBox(height: percentHeight(0.020)),
            confirmPass(),
            SizedBox(height: percentHeight(0.030)),
            button(),
            SizedBox(height: percentHeight(0.02)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "هل لديك حساب؟ ",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                InkWell(
                  onTap: () => pageReplacement(const LoginScreen()),
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: AppColors.lPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: percentHeight(0.02)),
          ],
        ),
      ),
    );
  }

  TextFormField fName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: fNameCtrl,
      validator: defaultValidator,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "الإسم",
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
        )),
      ),
    );
  }

  TextFormField lName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: lNameCtrl,
      validator: defaultValidator,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "الكنية",
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
        )),
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailCtrl,
      textInputAction: TextInputAction.next,
      validator: emailValidator,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "البريد الالكتروني",
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
        )),
      ),
    );
  }

  BlocBuilder<LoginBloc, LoginState> pass() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (_, c) => c is InvertPassHideState,
      builder: (context, state) {
        final bloc = BlocProvider.of<LoginBloc>(context);
        return TextFormField(
          keyboardType: TextInputType.text,
          controller: passwordCtrl,
          validator: passValidator,
          textInputAction: TextInputAction.next,
          obscureText: bloc.hidePass,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                  onTap: () => bloc.add(InvertShowPass()),
                  child: Icon(
                      bloc.hidePass ? Icons.visibility_off : Icons.visibility)),
              hintText: "كلمة المرور",
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        );
      },
    );
  }

  BlocBuilder<LoginBloc, LoginState> confirmPass() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (_, c) => c is InvertPassHideState,
      builder: (context, state) {
        final bloc = BlocProvider.of<LoginBloc>(context);
        return TextFormField(
          controller: confirmPasswordCtrl,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value != passwordCtrl.text) {
              return "لا تطابق كلمة المرور في الحقل السابق";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          obscureText: bloc.hidePass,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                  onTap: () => bloc.add(InvertShowPass()),
                  child: Icon(
                      bloc.hidePass ? Icons.visibility_off : Icons.visibility)),
              hintText: "تأكيد كلمة المرور",
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        );
      },
    );
  }

  BlocBuilder<LoginBloc, LoginState> button() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (_, c) => c is RegisterRequest,
      builder: (context, state) {
        if (state is RegisterRequest &&
            state.requestState == ProcessState.processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState == null ||
                !_formKey.currentState!.validate()) {
              return;
            }
            context.read<LoginBloc>().add(RegisterEvent(
                    newUser: UserEntity.newUser(
                  email: emailCtrl.text,
                  fName: fNameCtrl.text,
                  lName: lNameCtrl.text,
                  password: passwordCtrl.text,
                )));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: percentHeight(0.02)),
            child: const Text(
              "إنشاء حساب",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
