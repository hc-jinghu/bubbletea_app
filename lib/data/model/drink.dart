class Drink {
  final String name;
  final String imagePath;
  String price;
  int iceLevel;
  int sugarLevel;
  List<String> toppings = [];

  Drink({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.iceLevel,
    required this.sugarLevel,
    required this.toppings,
  });
}
