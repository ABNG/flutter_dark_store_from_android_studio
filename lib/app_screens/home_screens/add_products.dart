import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

const List<String> category = [
  "MEN",
  "WOMEN",
];

const List<String> sub_category = [
  "SHOES",
  "BRANDS",
];

List<Widget> addColors = [
  Container(
    width: 40,
    height: 40,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.minimize),
  ),
];

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String _selectedValue;
  String _subSelectedValue;
  bool value = true;
  File _image;
  final ImagePicker picker = ImagePicker();
  Map<int, File> imagePosition = {};

  Color currentColor = Colors.limeAccent;

  void changeColor(Color color) {
    setState(() {
      addColors.add(
        Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.minimize),
        ),
      );
    });
  }

  Future getImage(int index) async {
    final PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      imagePosition[index] = _image;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = category[0];
    _subSelectedValue = sub_category[0];
  }

  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "ADD PRODUCT",
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.03,
                    vertical: SizeConfig.screenHeight * 0.01),
                child: Text(
                  "PRODUCT PHOTOS",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.14,
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => SizedBox(
                        width: SizeConfig.screenHeight * 0.12,
                        height: SizeConfig.screenHeight * 0.12,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Colors.white,
                          child: imagePosition[index] == null
                              ? IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    getImage(index);
                                  },
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_image, fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.03,
                    vertical: SizeConfig.screenHeight * 0.03),
                child: Text(
                  "PRODUCT DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.04,
                  right: SizeConfig.screenWidth * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: "PRODUCT NAME IN ENGLISH",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableText(
                      title: "PRODUCT NAME IN ARABIC",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              title: "CATEGORY",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 35,
                              padding: const EdgeInsets.all(6.0),
                              width: SizeConfig.screenWidth / 2.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[300]),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                  ),
                                  value: _selectedValue,
                                  items: category
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                title: "QUANTITY",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ReusableTextFieldWithCenter(
                                text: "5",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: "SUB CATEGORY",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(6.0),
                      width: SizeConfig.screenWidth / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          value: _subSelectedValue,
                          items: sub_category
                              .map(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _subSelectedValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                title: "PRICE",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ReusableTextFieldWithCenter(
                                text: "AED 2500",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              ReusableText(
                                title: "ADD OFFER",
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Switch.adaptive(
                                  value: value,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Visibility(
                            visible: value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  title: "PRICE AFTER OFFER",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ReusableTextFieldWithCenter(
                                  text: "AED 2300",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableText(
                      title: "SIZE",
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    FittedBox(
                      child: Text(
                        "ENTER SIZES SEPARATED BY COMMAS (EXAMPLE S,M,L)",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableText(title: "COLORS"),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select Color'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: currentColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              addColors.length,
                              (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addColors.removeAt(index);
                                    });
                                  },
                                  child: addColors[index]))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: "PRODUCT DESCRIPTION IN ENGLISH",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableTextFieldWithCenter extends StatelessWidget {
  final String text;

  ReusableTextFieldWithCenter({this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.grey[300],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[300],
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  final int maxLines;

  ReusableTextField({this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[300],
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}

class ReusableText extends StatelessWidget {
  final String title;

  ReusableText({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );
  }
}
