import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/api/DatabaseHelper.dart';
import 'package:flutter_dark_store/app_screens/home_screens/forget_password.dart';
import 'package:flutter_dark_store/app_screens/home_screens/home_screen.dart';
import 'package:flutter_dark_store/app_screens/sign_up_screen.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_logo.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_textfield.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences preferences) {
      bool value = preferences.getBool(login_key) ?? false;
      if (value) {
        navigation(context);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffold,
      body: Center(
        child: isLoading
            ? Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.blue),
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: SizeConfig.screenHeight),
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
                          height: 10,
                        ),
                        ReusableTextField(
                          text: "E-MAIL",
                          icon: Icons.person_outline,
                          main: true,
                          controller: emailController,
                          onChange: (value) {
                            if (_formKey.currentState.validate()) {}
                          },
                          textInputType: TextInputType.emailAddress,
                        ),
                        ReusableTextField(
                          text: "PASSWORD",
                          icon: Icons.lock_outline,
                          main: true,
                          isPassword: true,
                          controller: passwordController,
                          onChange: (value) {
                            if (_formKey.currentState.validate()) {}
                          },
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgetPassword())),
                          child: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(
                                  right: SizeConfig.screenWidth * 0.08),
                              child: Text(
                                "Forget Password",
                                style: defaultStyle,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.75,
                          child: ReusableMaterialButton(
                            title: "LOGIN",
                            pressMe: () async {
                              if (_formKey.currentState.validate()) {
                                Map<String, dynamic> data = {
                                  "email": emailController.text,
                                  "password": passwordController.text
                                };

                                Response response =
                                    await DBHelper().loginUser(data, "login");
                                Map<String, dynamic> result = response.data;
                                if (result["error"] != null) {
                                  print(result["error"]);
                                  _scaffold.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${result["error"].toString()}",
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
                                } else {
                                  SharedPreferences pref = await _prefs;
                                  await pref.setBool(login_key, true);
                                  await pref.setString(email, emailController.text);
                                  navigation(context);
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.75,
                          child: OutlineButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignupScreen())),
                            child: Text(
                              "REGISTER",
                              style: defaultStyle,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            borderSide: BorderSide(
                              width: 4.0,
                              color: Colors.black,
                            ),
                            highlightedBorderColor: Colors.black,
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

  void navigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }
}
