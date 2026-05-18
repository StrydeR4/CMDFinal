
class Trip {
  final String city;
  final String image;
  final String description;
  final int price;

  bool favorite;

  Trip({
    required this.city,
    required this.image,
    required this.description,
    required this.price,
    this.favorite = false,
  });
}
