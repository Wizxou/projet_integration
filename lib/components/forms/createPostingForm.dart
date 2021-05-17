import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/services/database.dart';
import 'package:provider/provider.dart';

part 'createPostingForm.g.dart';

@hwidget
Widget createPostingForm() {
  final context = useContext();
  final user = Provider.of<User?>(context);

  final category = useState<PostingCategory>(PostingCategory.LawnMowing);
  final _title = useTextEditingController();
  final _titleListenable = useValueListenable(_title);
  final _description = useTextEditingController();
  final _descriptionListenable = useValueListenable(_description);
  final _image = useTextEditingController();
  final _imageListenable = useValueListenable(_image);
  final _price = useTextEditingController();
  final _priceListenable = useValueListenable(_price);

  final _phone = useTextEditingController();
  final _phoneListenable = useValueListenable(_phone);

  final _area = useTextEditingController();
  final _areaListenable = useValueListenable(_area);

  final _address = useTextEditingController();
  final _addressListenable = useValueListenable(_address);



  return Container(
    margin: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TextField(
          controller: _title,
          decoration: InputDecoration(
            hintText: "Enter title",
            border: OutlineInputBorder(),
          ),
        ),
       
        const SizedBox(height: 10.0),
        TextField(
          controller: _image,
          decoration: InputDecoration(
            hintText: "Enter image URL",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _price,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter price",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _phone,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter phone number",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _area,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter area",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: _address,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Enter address",
            border: OutlineInputBorder(),
          ),
        ),
         const SizedBox(height: 10.0),
        TextField(
          minLines: 5,
          maxLines: 10,
          controller: _description,
          decoration: InputDecoration(
            hintText: "Enter description",
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
          onPressed: () async {
            await DatabaseService().addPosting(
                title: _titleListenable.text.trim(),
                description: _descriptionListenable.text.trim(),
                price: double.parse(_priceListenable.text.trim()),
                image: _imageListenable.text.trim(),
                category: category.value.toString(),
                area: double.parse(_areaListenable.text.trim()),
                address: _addressListenable.text.trim(),
                phone: _phoneListenable.text.trim(),
                creatorUID: user!.uid);
          },
        ),
      ],
    ),
  );
}
