import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/models/index.dart';
part 'createPostingForm.g.dart';

@hwidget
Widget createPostingForm() {
  final category = useState<PostingCategory>(PostingCategory.LawnMowing);
  return Container(
    margin: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: "Enter title",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          minLines: 5,
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Enter description",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter image URL",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter price",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lawn Mowing'),
              Radio(
                groupValue: category.value,
                value: PostingCategory.LawnMowing,
                onChanged: (value) {
                  category.value = PostingCategory.LawnMowing;
                },
                activeColor: Colors.green,
              ),
              Text('Snow Cleaning'),
              Radio(
                groupValue: category.value,
                value: PostingCategory.SnowClearing,
                onChanged: (value) {
                  category.value = PostingCategory.SnowClearing;
                },
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text("Create the posting"),
          onPressed: () {},
        ),
      ],
    ),
  );
}
