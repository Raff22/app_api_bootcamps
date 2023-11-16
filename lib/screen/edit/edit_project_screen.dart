import 'package:flutter/material.dart';
import 'package:testapp_aoi/repository/post_user_method_networking.dart';
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
              onPressed: () async {
                if (controllerName!.text.trim().isNotEmpty &&
                    controllerDescription!.text.trim().isNotEmpty) {
                  PostUserMethodNetworking networking =
                      PostUserMethodNetworking();
                  Map<String, dynamic> bodyMap = {
                    "name": controllerName?.text.trim(),
                    "description": controllerDescription?.text.trim(),
                    "state": selectedDropMenu
                  };
                  print(bodyMap);
                  await networking.addNewProjectMethod(
                      context: context, body: bodyMap);
                  Navigator.pop(
                    context,
                  );
                }
              },
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
