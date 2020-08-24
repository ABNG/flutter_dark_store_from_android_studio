import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/api/DatabaseHelper.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_textfield.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "Forget Password",
      showIcon: false,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: SizeConfig.screenHeight),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableTextField(
                    text: "E-MAIL",
                    icon: Icons.person_outline,
                    main: true,
                    controller: mailController,
                    onChange: (value) {
                      if (_form.currentState.validate()) {}
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  ReusableTextField(
                    text: "NEW PASSWORD",
                    icon: Icons.lock_open,
                    main: true,
                    isPassword: true,
                    controller: password,
                    onChange: (value) {
                      if (_form.currentState.validate()) {}
                    },
                  ),
                  ReusableTextField(
                    text: "CONFIRM PASSWORD",
                    icon: Icons.lock_outline,
                    main: true,
                    isPassword: true,
                    controller: confirmPassword,
                    onChange: (value) {
                      if (_form.currentState.validate()) {}
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: SizeConfig.screenWidth * 0.75,
                      child: Builder(
                        builder: (BuildContext context) =>
                            ReusableMaterialButton(
                          title: "SAVE",
                          pressMe: () async {
                            if (_form.currentState.validate()) {
                              if (password.text == confirmPassword.text) {
                                Map<String, dynamic> map = {
                                  "email": mailController.text,
                                  "password": password.text
                                };
                                Response response = await DBHelper()
                                    .emailAuth(map, "store/emailAuth");
                                Map<String, dynamic> result = response.data;
                                if (result["error"] != null) {
                                  print(result["error"]);
                                } else {
                                  Navigator.pop(context);
                                }
                              } else {
                                showSnackbar(
                                    "password and confirm password does not match",
                                    context);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(String result, BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: SnackBarAction(
          onPressed: () {},
          label: "OK",
          textColor: Colors.white,
        ),
      ),
    );
  }
}
