import 'package:flutter/material.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/empty_text_field.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_dark_text.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';

const List<String> type = [
  "One",
  "Two",
  "Three",
  "Four",
];
const List<String> priority = [
  "low",
  "medium",
  "high",
];

class GetHelp extends StatefulWidget {
  @override
  _GetHelpState createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  String _selectedType;
  String _selectedPriority;

  @override
  void initState() {
    super.initState();
    _selectedType = type[0];
    _selectedPriority = priority[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GET HELP",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: SizeConfig.screenHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FlutterLogo(
                    size: 120,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ReusableDarkText(
                  text: "TITLE",
                ),
                ReusableEmptyTextField(),
                ReusableDarkText(
                  text: "TYPE",
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  padding: EdgeInsets.only(left: 5),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      value: _selectedType,
                      items: type
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                    ),
                  ),
                ),
                ReusableDarkText(
                  text: "PRIORITY",
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  padding: EdgeInsets.only(left: 5),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      value: _selectedPriority,
                      items: priority
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPriority = value;
                        });
                      },
                    ),
                  ),
                ),
                ReusableDarkText(
                  text: "DESCRIPTION",
                ),
                ReusableEmptyTextField(
                  maxLines: 4,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: ReusableMaterialButton(
                    title: "SEND",
                    pressMe: () {},
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 2,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ReusableDarkText(
                                text: "CONTACT US THROUGH WHATSAPP"),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey[400],
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -2,
                      right: 0,
                      child: Image.asset(
                        'images/whatsapp.png',
                        fit: BoxFit.cover,
                        width: 45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
