class MyProducts {
  final String name;
  final double price;
  final String image;

  MyProducts({this.name, this.price, this.image});

  static List<MyProducts> myProducts = [
    MyProducts(name: "hello1", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello2", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello3", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello4", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello5", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello6", price: 99.00, image: 'images/dummy.jpg'),
  ];
}
