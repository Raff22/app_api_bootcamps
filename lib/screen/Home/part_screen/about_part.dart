import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/widgets/LabelAbout.dart';
import 'package:testapp_aoi/screen/edit/edit_about_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';

class AboutPartWidget extends StatelessWidget {
  const AboutPartWidget(
      {super.key,
      this.about = "",
      this.email = "",
      this.phone = "",
      this.location = "",
      this.birthday = ""});
  final String about;
  final String email;
  final String phone;
  final String location;
  final String birthday;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  context.push(view: const EditAboutScreen());
                },
                icon: const Icon(Icons.edit))),
        Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Text(about.toString())),
        LabelAbout(
          title: "Email",
          value: email.toString(),
        ),
        LabelAbout(
          title: "Phone Number",
          value: phone.toString(),
        ),
        LabelAbout(
          title: "Location",
          value: location.toString(),
        ),
        LabelAbout(
          title: "birthday",
          value: birthday.toString(),
        ),
      ],
    );
  }
}
