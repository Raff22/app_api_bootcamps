import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/edit/widget/EditTextFelid.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/method_widget/showDatePicker.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key});

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerDescription = TextEditingController();
  TextEditingController? controllerPosition = TextEditingController();
  TextEditingController? controllerPhone = TextEditingController();
  TextEditingController? controllerLocation = TextEditingController();
  TextEditingController? controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Edit about"),
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
            label: "Name",
          ),
          EditTextFelid(
            controller: controllerDescription,
            maxLines: 10,
            label: "Description",
            hint: "Write your description",
          ),
          EditTextFelid(
            controller: controllerPosition,
            label: "Position",
          ),
          EditTextFelid(
            controller: controllerPhone,
            label: "Phone number",
            keyboardType: TextInputType.phone,
          ),
          EditTextFelid(
            controller: controllerLocation,
            label: "Location",
          ),
          EditTextFelid(
            controller: controllerDate,
            label: "Brithday",
            isFelid: false,
            onTap: () async {
              showDatePickerWidget(
                context: context,
                onDateTimeChanged: (date) {
                  print(date);
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
