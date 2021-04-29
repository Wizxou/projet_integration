import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'profilePage.g.dart';

@hwidget
Widget profilePage() {
  final context = useContext();
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.usatoday.com%2Fstory%2Flife%2Fmovies%2F2017%2F03%2F10%2Fjames-cameron-announces-another-avatar-2-delay-wont-come-out-2018%2F99022856%2F&psig=AOvVaw0edgNVbSB7PCjk14g_aLtr&ust=1620556366558000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIiIp4jxufACFQAAAAAdAAAAABAD',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment(0, 0.8),
                child: MaterialButton(
                  minWidth: 0,
                  elevation: 0.5,
                  color: Colors.white,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.pink,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: "Profession",
                ),
              ),
              const SizedBox(height: 10.0),
              InputDatePickerFormField(
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDate: DateTime.now(),
                fieldLabelText: "Date of Birth",
              ),
              const SizedBox(height: 10.0),
              Text(
                "Interests",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 5.0),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  ChoiceChip(
                    label: Text("Technology"),
                    onSelected: (val) {},
                    selected: true,
                  ),
                  ChoiceChip(
                    label: Text("Coding"),
                    onSelected: (val) {},
                    selected: true,
                  ),
                  ChoiceChip(
                    label: Text("Tutoring"),
                    onSelected: (val) {},
                    selected: false,
                  ),
                  ChoiceChip(
                    label: Text("Video making"),
                    onSelected: (val) {},
                    selected: false,
                  ),
                  ChoiceChip(
                    label: Text("Gaming"),
                    onSelected: (val) {},
                    selected: true,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                child: Text("Continue"),
                color: Colors.pink,
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
