class ProductsModel{
  final String img;
  final String title;
  final String price;
  final String skidka;
  int count;
  bool isTapped;
   bool isLike;
  ProductsModel(this.img, this.title, this.price, this.skidka,this.isLike,  {this.count=1,this.isTapped=false,});

}