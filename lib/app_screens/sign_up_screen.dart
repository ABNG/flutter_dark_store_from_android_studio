import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/api/DatabaseHelper.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_logo.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_textfield.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();
  TextEditingController myConfirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool isDesigner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: SizeConfig.screenHeight),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReusableLogo(fontSize: 35, letterSpacing: 10.0),
                    SizedBox(
                      height: 5,
                    ),
                    subtitle,
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableRaisedButton(
                          text: "DESIGNER",
                          pressMe: () {
                            setState(() {
                              isDesigner = true;
                            });
                          },
                          color: isDesigner ? Colors.black : Colors.grey[200],
                          btnColor: isDesigner ? Colors.white : Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ReusableRaisedButton(
                          text: "VENDOR",
                          pressMe: () {
                            setState(() {
                              isDesigner = false;
                            });
                          },
                          color: isDesigner ? Colors.grey[200] : Colors.black,
                          btnColor: isDesigner ? Colors.black : Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(
                      text: "STORE NAME",
                      icon: Icons.person_outline,
                      main: false,
                      controller: nameController,
                      onChange: (value) {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                    ReusableTextField(
                      text: "E-MAIL",
                      icon: Icons.mail_outline,
                      main: false,
                      controller: myEmailController,
                      onChange: (value) {
                        if (_formKey.currentState.validate()) {}
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    ReusableTextField(
                      text: "PASSWORD",
                      icon: Icons.lock_open,
                      main: false,
                      isPassword: true,
                      controller: myPasswordController,
                      onChange: (value) {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                    ReusableTextField(
                      text: "CONFIRM PASSWORD",
                      icon: Icons.lock_outline,
                      main: false,
                      isPassword: true,
                      controller: myConfirmPasswordController,
                      onChange: (value) {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.03,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.75,
                      child: ReusableMaterialButton(
                        title: "REGISTER",
                        pressMe: () async {
                          if (_formKey.currentState.validate()) {
                            if (myPasswordController.text ==
                                myConfirmPasswordController.text) {
                              Map<String, dynamic> registerUser = {
                                "name": nameController.text,
                                "email": myEmailController.text,
                                "password": myPasswordController.text,
                                "typeofuser":
                                    isDesigner ? "designer" : "vendor",
                              };
                              Response response = await DBHelper().registerUser(
                                  registerUser, "store/registration");
                              if (response.statusCode == 200) {
                                Map<String, dynamic> result = response.data;
                                if (result["error"] != null) {
                                  print(result["error"]);
                                  showSnackbar(result["error"].toString());
                                } else {
                                  Navigator.pop(context);
                                }
                              }
                            } else {
                              showSnackbar(
                                  "password and confirm password does not match");
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackbar(String result) {
    _scaffold.currentState.showSnackBar(
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
