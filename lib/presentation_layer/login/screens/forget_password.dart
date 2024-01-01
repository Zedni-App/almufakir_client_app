import 'package:flutter/material.dart';
import 'package:zidne/presentation_layer/login/components/logo_image.dart';

import '../../../core/app_styles/theme.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lprimarycolor5,
      body: ListView(
        children: [
          SizedBox(
            width: size.width * 1.0,
            height: size.height * 1.0,
            child: ListView(children: [
             const LogoImage(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.2,
                    top: size.height * 0.05,
                    right: size.width * 0.050,
                    left: size.width * 0.050,
                  ),
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "البريد الالكتروني",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'أدخل بريدك الإلكتروني سنرسل تعليمات لإعادة تعيين كلمة المرور الخاصة بك',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02),
                            child: const Text(
                              "إرسال",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  swapHidden() {
    if (ishidden == true) {
      ishidden = false;
    } else {
      ishidden = true;
    }
    setState(() {});
  }
}
