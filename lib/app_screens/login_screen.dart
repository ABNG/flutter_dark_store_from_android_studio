import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/home_screens/home_screen.dart';
import 'package:flutter_dark_store/app_screens/sign_up_screen.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_logo.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_textfield.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: SizeConfig.screenHeight),
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
                ),
                ReusableTextField(
                  text: "PASSWORD",
                  icon: Icons.lock_outline,
                  main: true,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: SizeConfig.screenWidth * 0.75,
                    child: ReusableMaterialButton(
                      title: "LOGIN",
                      pressMe: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen())),
                    )),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.75,
                  child: OutlineButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignupScreen())),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
    );
  }
}
