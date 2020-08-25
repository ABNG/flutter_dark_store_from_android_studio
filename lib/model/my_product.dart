class MyProducts {
  int pid;
  String name;
  int oldPrice;
  String image;
  int newPrice;
  String desc;
  String color;
  int stock;
  String brand;
  String type;
  String cat;
  String sub_cat;
  String sizes;

  MyProducts.fromJson(Map<String, dynamic> data) {
    this.pid = data["pid"];
    this.name = data["name"];
    this.oldPrice = data["old_price"];
    this.image = data["img_path"];
    this.newPrice = data["price"];
    this.desc = data["desc"];
    this.color = data["color"];
    this.stock = data["stock"];
    this.brand = data["brand"];
    this.type = data["type"];
    this.cat = data["cat"];
    this.sub_cat = data["sub_cat"];
    this.sizes = data["sizes"];
  }
}
