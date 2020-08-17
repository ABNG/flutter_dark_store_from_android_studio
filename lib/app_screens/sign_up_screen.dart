import 'package:flutter/material.dart';
import 'package:flutter_dark_store/app_screens/login_screen.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_logo.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_textfield.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  ReusableTextField(
                    text: "STORE NAME",
                    icon: Icons.person_outline,
                    main: false,
                  ),
                  ReusableTextField(
                    text: "E-MAIL",
                    icon: Icons.mail_outline,
                    main: false,
                  ),
                  ReusableTextField(
                    text: "PASSWORD",
                    icon: Icons.lock_open,
                    main: false,
                  ),
                  ReusableTextField(
                    text: "CONFIRM PASSWORD",
                    icon: Icons.lock_outline,
                    main: false,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.03,
                  ),
                  SizedBox(
                      width: SizeConfig.screenWidth * 0.75,
                      child: ReusableMaterialButton(
                        title: "REGISTER",
                        pressMe: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LogInScreen())),
                      )),
                ],
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
}
