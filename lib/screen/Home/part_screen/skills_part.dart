import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardEducation.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardSkill.dart';
import 'package:testapp_aoi/screen/edit/edit_skills_screen.dart';
import 'package:testapp_aoi/utils/Layaout.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/method_widget/showDeleteDialog.dart';

class SkillsPartWidget extends StatelessWidget {
  const SkillsPartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 10,
      spacing: 10,
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  context.push(view:  AddSkillsScreen());
                },
                icon: const Icon(Icons.add_circle_outlined))),
        CardSkill(
          skill: "Python",
          onDeletedSkill: () {
            print("Python");
          },
        ),
        const CardSkill(
          skill: "Flutter developer",
        ),
        const CardSkill(
          skill: "Dart",
        ),
        const CardSkill(
          skill: "Backend developer",
        ),
        const CardSkill(
          skill: "UI/UX",
        ),
        const CardSkill(
          skill: "Swift",
        ),
        const CardSkill(
          skill: "Mobile application developer",
        ),
      ],
    );
  }
}
