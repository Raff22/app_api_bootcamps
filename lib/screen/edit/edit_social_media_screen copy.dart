import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/edit/widget/DropMenuWidget.dart';
import 'package:testapp_aoi/screen/edit/widget/EditTextFelid.dart';

class AddSocialMediaScreen extends StatelessWidget {
  AddSocialMediaScreen({super.key});
  TextEditingController? controllerName = TextEditingController();
  String? selectedDropMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add Social Media"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.upload_sharp,
                color: Colors.green,
              ))
        ],
      ),
      body: ListView(children: [
        EditTextFelid(
          controller: controllerName,
          label: "Name Project",
          keyboardType: TextInputType.text,
        ),
        DropMenuWidget(
          menuItem: const [
            'ُtwitter',
            'facebook',
            'youtube',
            'whatsapp',
            'instagram',
            'tiktok',
            'telegram',
            'snapchat',
            'other',
          ],
          onChanged: (selected) {
            print(selected);
            selectedDropMenu = selected;
          },
        ),
      ]),
    );
  }
}
