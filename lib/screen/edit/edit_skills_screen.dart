import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardSkill.dart';
import 'package:testapp_aoi/screen/edit/widget/EditTextFelid.dart';

class AddSkillsScreen extends StatefulWidget {
  const AddSkillsScreen({super.key});

  @override
  State<AddSkillsScreen> createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  TextEditingController? controllerSkill = TextEditingController();

  List<String> skills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add new Skills"),
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
        Row(
          children: [
            Expanded(
              flex: 5,
              child: EditTextFelid(
                controller: controllerSkill,
                label: "Name Project",
                keyboardType: TextInputType.text,
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      if (controllerSkill!.text.isNotEmpty ||
                          controllerSkill!.text.length > 2) {
                        skills.add(controllerSkill!.text);
                        controllerSkill?.clear();
                        setState(() {});
                      }
                    },
                    icon: const Text("Add"))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: skills
                  .map(
                    (nameSkill) => CardSkill(
                      skill: nameSkill,
                      onDeletedSkill: () {},
                    ),
                  )
                  .toList()),
        )
      ]),
    );
  }
}
