import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dark_store/api/DatabaseHelper.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/model/my_product.dart';
import 'package:flutter_dark_store/reusable_widgets/Reusable_material_button.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_dark_store/utils/utils.dart';
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
    width: 38,
    height: 35,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
      Icons.minimize,
    ),
  ),
];

class AddProducts extends StatefulWidget {
  final MyProducts product;

  AddProducts({this.product});

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String _selectedValue;
  String _subSelectedValue;
  bool value = true;
  File _image;
  final ImagePicker picker = ImagePicker();
  Map<int, dynamic> imagePosition = {};
  List<String> deletedImages = [];
  List<int> colors = [4294951175];

  Color currentColor = Colors.limeAccent;
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController eNameController = TextEditingController();
  TextEditingController aNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController oldPriceController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController descController = TextEditingController();

  void changeColor(Color color) {
    colors.add(color.value);
    print(color.value);
    setState(() {
      addColors.add(
        Container(
          width: 38,
          height: 35,
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Pick Image",
          style: defaultStyle,
        ),
        content: Text("You can pick image from"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              pickImage(ImageSource.camera, index);
            },
            child: Text("CAMERA"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              pickImage(ImageSource.gallery, index);
            },
            child: Text("GALLERY"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    addColors.clear();
    colors.clear();
    imagePosition.clear();
    _selectedValue = widget.product == null ? category[0] : widget.product.cat;
    _subSelectedValue =
        widget.product == null ? sub_category[0] : widget.product.sub_cat;
    eNameController.text = widget.product == null ? "" : widget.product.name;
    quantityController.text =
        widget.product == null ? "" : widget.product.stock.toString();
    oldPriceController.text =
        widget.product == null ? "" : widget.product.oldPrice.toString();
    newPriceController.text =
        widget.product == null ? "" : widget.product.newPrice.toString();
    sizeController.text = widget.product == null ? "" : widget.product.sizes;
    descController.text = widget.product == null ? "" : widget.product.desc;

    //show Color from My Product

    if (widget.product == null) {
      colors.add(4294951175);
      addColors.add(
        Container(
          width: 38,
          height: 35,
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.minimize),
        ),
      );
    } else {
      String values =
          widget.product.color.substring(1, widget.product.color.length - 1);
      print(values);
      while (values.contains(",")) {
        colors.add(int.parse(values.split(",")[0]));
        values = values.substring(values.indexOf(",") + 1);
        print(values);
      }
      if (!values.contains(",")) {
        colors.add(int.parse(values));
      }

      for (int color in colors) {
        addColors.add(
          Container(
            width: 38,
            height: 35,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.minimize),
          ),
        );
      }
    }

    //get image from myProducts

    if (widget.product != null) {
      String image = widget.product.image;
      int index = 0;
      print(image);

      while (image.contains(",")) {
        imagePosition.putIfAbsent(index, () => image.split(",")[0]);
        image = image.substring(image.indexOf(",") + 1);
        index++;
      }
      if (!image.contains(",")) {
        imagePosition.putIfAbsent(index, () => image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: widget.product == null ? "ADD PRODUCT" : "UPDATE PRODUCT",
      body: ListView(
        children: [
          Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.03,
                      vertical: SizeConfig.screenHeight * 0.01),
                  child: Text(
                    "PRODUCT PHOTOS",
                    style: defaultStyle,
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
                            child: imagePosition.keys
                                        .toList()
                                        .contains(index) ==
                                    false
                                ? IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      getImage(index);
                                    },
                                  )
                                : Stack(
                                    fit: StackFit.expand,
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: imagePosition[index] is File
                                            ? Image.file(imagePosition[index],
                                                fit: BoxFit.cover)
                                            : Image.network(
                                                image_url +
                                                    imagePosition[index],
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Positioned(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              deletedImages
                                                  .add(imagePosition[index]);
                                              imagePosition.remove(index);
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
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
                    style: defaultStyle,
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
                      ReusableTextField(
                        controller: eNameController,
                        onChanged: (value) {
                          if (_formState.currentState.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableText(
                        title: "PRODUCT NAME IN ARABIC",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ReusableTextField(
                        controller: aNameController,
                        onChanged: (value) {
                          if (_formState.currentState.validate()) {}
                        },
                      ),
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
                                              style: defaultStyle.copyWith(
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
                                ReusableTextField(
                                  isQuantity: true,
                                  controller: quantityController,
                                  textInputType: TextInputType.number,
                                  text: "5",
                                  onChanged: (value) {
                                    if (_formState.currentState.validate()) {}
                                  },
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
                                      style: defaultStyle.copyWith(
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
                                ReusableTextField(
                                  controller: oldPriceController,
                                  isQuantity: true,
                                  textInputType: TextInputType.number,
                                  text: "AED 2500",
                                  onChanged: (value) {
                                    if (_formState.currentState.validate()) {}
                                  },
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
                                  ReusableTextField(
                                    controller: newPriceController,
                                    isQuantity: true,
                                    textInputType: TextInputType.number,
                                    text: "AED 2300",
                                    onChanged: (value) {
                                      if (_formState.currentState.validate()) {}
                                    },
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
                      ReusableTextField(
                        controller: sizeController,
                        onChanged: (value) {
                          if (_formState.currentState.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ReusableText(title: "COLORS"),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Utils.hideKeyboard(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Select Color'),
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor: currentColor,
                                    onColorChanged: changeColor,
//                                          availableColors: [
//                                          Color(0xffffaa00),
//                                        ],
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
                                        colors.removeAt(index);
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
                        controller: descController,
                        onChanged: (value) {
                          if (_formState.currentState.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Builder(
                          builder: (BuildContext context) =>
                              ReusableMaterialButton(
                            title: widget.product == null
                                ? "ADD ITEM"
                                : "UPDATE ITEM",
                            pressMe: () async {
                              if (_formState.currentState.validate()) {
                                if (imagePosition.isEmpty ||
                                    addColors.isEmpty) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Color or Image is not Selected",
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
                                  FormData data = FormData.fromMap({
                                    "name": eNameController.text,
                                    "img_path": await getAllImage(),
                                    "desc": descController.text,
                                    "price": checkForValue(),
                                    "old_price":
                                        int.parse(oldPriceController.text),
                                    "color": colors.toString(),
                                    "stock": int.parse(quantityController.text),
                                    "brand": "not know",
                                    "type": "not know",
                                    "cat": _selectedValue,
                                    "sub_cat": _subSelectedValue,
                                    "sizes": sizeController.text,
                                  });
                                  if (widget.product == null) {
                                    Response response = await DBHelper()
                                        .addProduct(data, "products");
                                    if (response.statusCode == 200) {
                                      print(response.data);
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Item Added",
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
                                  } else {
                                    print(deletedImages);
                                    FormData dataUpdate = FormData.fromMap({
                                      "id": widget.product.pid,
                                      "name": eNameController.text,
                                      "img_path": await getAllImage(),
                                      "desc": descController.text,
                                      "price": checkForValue(),
                                      "old_price":
                                          int.parse(oldPriceController.text),
                                      "color": colors.toString(),
                                      "stock":
                                          int.parse(quantityController.text),
                                      "brand": "not know",
                                      "type": "not know",
                                      "cat": _selectedValue,
                                      "sub_cat": _subSelectedValue,
                                      "sizes": sizeController.text,
                                      "deleted_images": deletedImages,
                                    });
                                    Response response = await DBHelper()
                                        .addProduct(dataUpdate, "products");
                                    if (response.statusCode == 200) {
                                      print(response);
//                                      Scaffold.of(context).showSnackBar(
//                                        SnackBar(
//                                          content: Text(
//                                            "Item Updated",
//                                            style: TextStyle(
//                                              color: Colors.white,
//                                              fontWeight: FontWeight.bold,
//                                            ),
//                                          ),
//                                          action: SnackBarAction(
//                                            onPressed: () {},
//                                            label: "OK",
//                                            textColor: Colors.white,
//                                          ),
//                                        ),
//                                      );
                                      Navigator.pop(context, true);
                                    }
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void pickImage(ImageSource imageSource, int index) async {
    final PickedFile pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      _image = File(pickedFile.path);
      imagePosition.putIfAbsent(index, () => _image);
    });
  }

  Future<List<dynamic>> getAllImage() async {
    List<dynamic> imgUpload = [];
    for (dynamic image in imagePosition.values) {
      if (image != null) {
        if (image is File)
          imgUpload.add(await MultipartFile.fromFile(image.path));
      }
    }
    print(imgUpload);
    return imgUpload;
  }

  int checkForValue() {
    if (value) {
      return int.parse(newPriceController.text) ?? 0;
    } else {
      return int.parse(newPriceController.text = "0");
    }
  }
}

class ReusableTextField extends StatelessWidget {
  final int maxLines;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isQuantity;
  final String text;
  final Function onChanged;

  ReusableTextField(
      {this.controller,
      this.text,
      this.onChanged,
      this.isQuantity = false,
      this.textInputType = TextInputType.text,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      style: defaultStyle,
      maxLines: maxLines,
      textAlign: isQuantity ? TextAlign.center : TextAlign.start,
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
        hintText: isQuantity ? text : "",
        hintStyle: TextStyle(color: Colors.grey[300]),
      ),
      validator: (value) {
        if (value.isEmpty) return "Field is empty";

        return null;
      },
      onChanged: onChanged,
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
      style: defaultStyle.copyWith(
        fontSize: 10,
      ),
    );
  }
}
