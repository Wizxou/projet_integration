import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helpy/models/index.dart';

class PostingCreation extends ChangeNotifier {
  //Fields: (with underscore so cannot be accessed directly)
  String _title = "";
  String _description = "";
  String _image = "";
  double _price = 0;
  PostingCategory _category = PostingCategory.LawnMowing;

  // Getters
  String get title => _title;
  String get description => _description;
  String get image => _image;
  double get price => _price;
  String get category => _category.toString().substring(15);

  //Setters
  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setDescription(String desc) {
    _description = desc;
    notifyListeners();
  }

  void setImage(String image) {
    _image = image;
    notifyListeners();
  }

  void setPrice(double price) {
    _price = price;
    notifyListeners();
  }

  void setPostingCategory(PostingCategory category) {
    _category = category;
    notifyListeners();
  }

  //When a posting has been successfully created
  void clearAll() {
    _title = "";
    _description = "";
    _image = "";
    _price = 0;
    _category = PostingCategory.LawnMowing;
    notifyListeners();
  }
}
