import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/edit/widget/DropMenuWidget.dart';
import 'package:testapp_aoi/screen/edit/widget/EditTextFelid.dart';

class AddProjectScreen extends StatelessWidget {
  AddProjectScreen({super.key});
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerDescription = TextEditingController();
  String? selectedDropMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add new Project"),
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
        EditTextFelid(
          controller: controllerDescription,
          label: "Description project",
          keyboardType: TextInputType.text,
          maxLines: 10,
        ),
        DropMenuWidget(
          menuItem: const [
            'completed',
            'processing',
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
