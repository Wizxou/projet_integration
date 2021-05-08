enum PostingCategory { LawnMowing, SnowClearing }

class Posting {
  final String uid;
  final String title;
  final String description;
  final double price;
  final String image;
  final String creatorUID;
  final String employeeUID;
  final PostingCategory category;

  Posting(
      {required this.uid,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.creatorUID,
      required this.employeeUID,
      required this.category});
}
