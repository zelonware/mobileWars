class Food {
  String name;
  int price;
  String imgPath;
  int rating;

  Food(
      {required this.name,
      required this.price,
      required this.imgPath,
      required this.rating});

  String get _name => name;
  int get _price => price;
  String get _imgPath => imgPath;
  int get _rating => rating;
}
