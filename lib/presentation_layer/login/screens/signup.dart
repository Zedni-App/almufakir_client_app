import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/core/utilities/validators.dart';
import 'package:zidne/presentation_layer/login/components/logo_image.dart';
import '../../../core/app_styles/size_config.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/short_method.dart';
import '../controller/login_bloc.dart';
import 'login.dart';
import '../../../core/app_styles/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    nameCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lprimarycolor5,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const LogoImage(),
            name(),
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
                      color: lPrimaryColor1,
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

  TextFormField name() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.name,
      controller: nameCtrl,
      validator: defaultValidator,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "اسم المستخدم",
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
        )),
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
      maxLines: 1,
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
          maxLines: 1,
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
          maxLines: 1,
          controller: confirmPasswordCtrl,
          keyboardType: TextInputType.text,
          validator: (value){
            if(value!=passwordCtrl.text){
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
                  email: emailCtrl.text,
                  name: nameCtrl.text,
                  password: passwordCtrl.text,
                ));
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
