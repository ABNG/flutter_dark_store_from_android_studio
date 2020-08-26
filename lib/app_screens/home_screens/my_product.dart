import 'package:flutter/material.dart';
import 'package:flutter_dark_store/api/produt.dart';
import 'package:flutter_dark_store/app_screens/home_screens/add_products.dart';
import 'package:flutter_dark_store/constants/const.dart';
import 'package:flutter_dark_store/model/my_product.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_appbar.dart';
import 'package:flutter_dark_store/reusable_widgets/reusable_raised_button.dart';
import 'package:flutter_dark_store/utils/SizeConfig.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<MyProducts> products = List<MyProducts>();
  List<MyProducts> filterProducts = List<MyProducts>();
  bool isLoading = true;
  RefreshController _refreshController;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
    _refreshController = RefreshController(initialRefresh: false);
  }

  void _onRefresh() async {
    searchController.text = "";
    isLoading = true;
    getAllProducts();
    _refreshController.refreshCompleted();
  }

  void getAllProducts() async {
    products = await Products.getAllProducts();
    if (products.length >= 0) {
      isLoading = false;
      filterProducts.addAll(products);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReusableAppbar(
      title: "My PRODUCTS",
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              style: defaultStyle,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                filled: true,
                border: InputBorder.none,
              ),
              onChanged: (value) async {
                if (value.isNotEmpty) {
                  products = await Products.searchProduct(value);
                  setState(() {});
                } else if (value.trim().isEmpty) {
                  setState(() {
                    products = filterProducts;
                  });
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : products.length == 0
                    ? Center(
                        child: Text(
                          "No Product found",
                          textScaleFactor: 1.5,
                        ),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          enablePullDown: true,
                          onRefresh: _onRefresh,
                          controller: _refreshController,
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            childAspectRatio: 0.78,
                            children: List.generate(
                              products.length,
                              (index) => Card(
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: SizeConfig.screenHeight * 0.15,
                                      width: double.infinity,
                                      child: Image.network(
                                        image_url +
                                            products[index].image.split(",")[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(products[index].name),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          "${products[index].oldPrice.toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          "AED",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ReusableRaisedButton(
                                            text: "Remove",
                                            pressMe: () async {
                                              bool value =
                                                  await Products.removeProduct(
                                                      products[index].pid);
                                              if (value) {
                                                setState(() {
                                                  products.removeAt(index);
                                                });
                                              }
                                            },
                                            color: Colors.red,
                                            height:
                                                SizeConfig.screenHeight * 0.04,
                                          ),
                                        ),
                                        Expanded(
                                          child: ReusableRaisedButton(
                                            text: "Edit",
                                            pressMe: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          AddProducts(
                                                              product: products[
                                                                  index]))).then(
                                                  (value) {
                                                if (value) getAllProducts();
                                              });
                                            },
                                            color: Colors.green,
                                            height:
                                                SizeConfig.screenHeight * 0.04,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
