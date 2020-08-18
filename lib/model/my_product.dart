class MyProducts {
  final String name;
  final double price;
  final String image;

  MyProducts({this.name, this.price, this.image});

  static List<MyProducts> myProducts = [
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
    MyProducts(name: "hello", price: 99.00, image: 'images/dummy.jpg'),
  ];
}
