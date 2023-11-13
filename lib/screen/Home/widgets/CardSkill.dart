import 'package:flutter/material.dart';
import 'package:testapp_aoi/utils/method_widget/showDeleteDialog.dart';

class CardSkill extends StatelessWidget {
  const CardSkill({super.key, required this.skill, this.onDeletedSkill});
  final String skill;
  final Function()? onDeletedSkill;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill.toString()),
      deleteIcon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 15,
      ),
      elevation: 10,
      onDeleted: () {
        showDeleteDialog(
            context: context,
            nameOFdelete: skill,
            onDeleted: () {
              if (onDeletedSkill != null) {
                onDeletedSkill!();
              }
            });
      },
    );
  }
}
