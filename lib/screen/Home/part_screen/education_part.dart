import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardEducation.dart';
import 'package:testapp_aoi/screen/edit/edit_about_screen.dart';
import 'package:testapp_aoi/screen/edit/edit_educationt_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';

class EducationPartWidget extends StatefulWidget {
  const EducationPartWidget({
    super.key,
  });

  @override
  State<EducationPartWidget> createState() => _EducationPartWidgetState();
}

class _EducationPartWidgetState extends State<EducationPartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  context.push(view: AddEducationScreen());
                },
                icon: const Icon(Icons.add_circle_outlined))),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
        const CardEducation(
          university: 'taibah',
          level: 'Bachelors',
          specialization: 'CIS',
          college: 'Cs',
          dateGraduation: '2030-08-08',
        ),
      ],
    );
  }
}
