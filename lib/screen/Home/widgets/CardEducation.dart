import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class CardEducation extends StatelessWidget {
  const CardEducation(
      {super.key,
      this.university = '---',
      this.level = '---',
      this.specialization = '---',
      this.college = '---',
      this.dateGraduation = '---',
      this.onTapDelete});
  final String university;
  final String level;
  final String specialization;
  final String college;
  final String dateGraduation;
  final bool Function()? onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwipeActionCell(
        key: UniqueKey(),
        trailingActions: <SwipeAction>[
          SwipeAction(

              /// this is the same as iOS native
              performsFirstActionWithFullSwipe: true,
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onTap: (CompletionHandler handler) async {
                if (onTapDelete != null) {
                  handler(onTapDelete!());
                } else {
                  handler(false);
                }
              },
              color: Colors.red),
        ],
        child: ListTile(
          title: Text(university.toString()),
          subtitle: Column(
            children: [
              Text(level.toString()),
              Row(
                children: [
                  const Text("Specialization:"),
                  Text(specialization.toString()),
                ],
              ),
              Row(
                children: [
                  const Text("College:"),
                  Text(college.toString()),
                ],
              ),
              Row(
                children: [
                  const Text("Graduation:"),
                  Text(dateGraduation.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
