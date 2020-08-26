import 'package:flutter/material.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/empty_text_field.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_dark_text.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

class StoredInfo extends StatefulWidget {
  @override
  _StoredInfoState createState() => _StoredInfoState();
}

class _StoredInfoState extends State<StoredInfo> {
  TextEditingController eNameController = TextEditingController();
  TextEditingController aNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "STORE INFO",
      showIcon: false,
      body: ListView(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: SizeConfig.screenHeight,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableDarkText(
                      text: "EMAIL",
                    ),
                    Text(
                      "EXAMPLE@EMAIL.COM",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableDarkText(
                      text: "STORE NAME IN ENGLISH",
                    ),
                    ReusableEmptyTextField(
                      controller: eNameController,
                      onChange: (value) {
                        if (_form.currentState.validate()) {}
                      },
                    ),
                    ReusableDarkText(
                      text: "STORE NAME IN ARABIC",
                    ),
                    ReusableEmptyTextField(
                      controller: aNameController,
                      onChange: (value) {
                        if (_form.currentState.validate()) {}
                      },
                    ),
                    ReusableDarkText(
                      text: "CONTACT NUMBER",
                    ),
                    ReusableEmptyTextField(
                      textInputType: TextInputType.phone,
                      controller: contactController,
                      onChange: (value) {
                        if (_form.currentState.validate()) {}
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.4,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: SizeConfig.screenWidth,
                        child: ReusableMaterialButton(
                          title: "SAVE",
                          pressMe: () {
                            if (_form.currentState.validate()) {
                              print("ok");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
