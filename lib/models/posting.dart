enum PostingCategory { LawnMowing, SnowClearing }

class Posting {
  final String uid;
  final String title;
  final String description;
  final double price;
  final String image;
  final String creatorUID;
  final String employeeUID;
  final double area;
  final String phone;
  final String address;
  final PostingCategory category;

  Posting(
      {required this.uid,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.creatorUID,
      required this.employeeUID,
      required this.area,
      required this.phone,
      required this.address,
      required this.category});
}
