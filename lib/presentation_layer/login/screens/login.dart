import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilities/validators.dart';
import '../../../core/utilities/short_method.dart';
import '../../../core/app_styles/size_config.dart';
import '../../../core/enums.dart';
import '../components/logo_image.dart';
import '../controller/login_bloc.dart';

import '../../../core/app_styles/theme.dart';
import 'forget_password.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
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
              LogoImage(),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailCtrl,
                validator: emailValidator,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "البريد الإلكتروني",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                  )),
                ),
              ),
              SizedBox(height: percentHeight(0.020)),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (_, c) => c is InvertPassHideState,
                builder: (context, state) {
                  final bloc = BlocProvider.of<LoginBloc>(context);
                  return TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: passCtrl,
                    textInputAction: TextInputAction.done,
                    obscureText: bloc.hidePass,
                    validator: passValidator,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () => bloc.add(InvertShowPass()),
                            child: Icon(bloc.hidePass
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: "كلمة المرور",
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: percentHeight(0.02),
                  right: percentHeight(0.01),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => pagePush(const ForgetPasswordScreen()),
                      child: const Text(
                        "هل نسيت كلمة السر؟ ",
                        style: TextStyle(
                            color: lPrimaryColor1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: percentHeight(0.011)),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (_, c) => c is LoginRequest,
                builder: (context, state) {
                  if (state is LoginRequest &&
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
                      context.read<LoginBloc>().add(LoginEvent(
                            email: emailCtrl.text,
                            password: passCtrl.text,
                          ));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: percentHeight(0.02)),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: percentHeight(0.02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "هل لديك حساب؟ ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7), fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () => pageReplacement(const SignUpScreen()),
                    child: const Text(
                      "إنشاء حساب",
                      style: TextStyle(
                          color: lPrimaryColor1,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

