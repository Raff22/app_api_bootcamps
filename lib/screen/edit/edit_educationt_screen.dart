import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/edit/widget/DropMenuWidget.dart';
import 'package:testapp_aoi/screen/edit/widget/EditTextFelid.dart';
import 'package:testapp_aoi/utils/method_widget/showDatePicker.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController? controllerUniversity = TextEditingController();
  TextEditingController? controllerCollege = TextEditingController();
  TextEditingController? controllerSpecialization = TextEditingController();
  TextEditingController? controllerGraduationDate = TextEditingController();
  String? selectedDropMenu;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Add new education"),
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
            controller: controllerUniversity,
            label: "University",
          ),
          EditTextFelid(
            controller: controllerCollege,
            label: "College",
          ),
          EditTextFelid(
            controller: controllerSpecialization,
            label: "Specialization",
          ),
          DropMenuWidget(
            menuItem: const [
              'school',
              'diploma',
              'Bachelors',
              'Master',
              'Ph.D',
              'other'
            ],
            onChanged: (selected) {
              print(selected);
              selectedDropMenu = selected;
            },
          ),
          EditTextFelid(
            controller: controllerGraduationDate,
            label: "Graduation date",
            isFelid: false,
            onTap: () async {
              showDatePickerWidget(
                context: context,
                onDateTimeChanged: (date) {
                  print(date);
                  controllerGraduationDate?.text = date;
                  setState(() {});
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
