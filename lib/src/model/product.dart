class Product {
  String id;
  String productName;
  List<dynamic> imageList;
  String category;
  List<dynamic> sizeList;
  List<dynamic> colorList;
  String price;
  String salePrice;
  String brand;
  String madeIn;
  String quantity;
  String description;
  double rating;

  Product(
      {this.id,
      this.productName,
      this.imageList,
      this.category,
      this.sizeList,
      this.colorList,
      this.price,
      this.salePrice,
      this.brand,
      this.madeIn,
      this.quantity,
      this.description,
      this.rating});
}
