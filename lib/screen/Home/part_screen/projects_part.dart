import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:testapp_aoi/models/userModels/project_model.dart';
import 'package:testapp_aoi/repository/user_method_networking.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardEducation.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardProject.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardSkill.dart';
import 'package:testapp_aoi/screen/edit/edit_project_screen.dart';
import 'package:testapp_aoi/utils/Layaout.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/method_widget/showDeleteDialog.dart';

class ProjectsPart extends StatefulWidget {
  const ProjectsPart({
    super.key,
  });

  @override
  State<ProjectsPart> createState() => _ProjectsPartState();
}

class _ProjectsPartState extends State<ProjectsPart> {
  ProjectModel? dataProjects;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProject();
  }

  loadProject() async {
    UserMethodNetworking network = UserMethodNetworking();
    dataProjects = await network.getProjectsMethod(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  context.push(view: AddProjectScreen());
                },
                icon: const Icon(Icons.add_circle_outlined))),
        if (dataProjects == null) const CircularProgressIndicator(),
        if (dataProjects != null)
          ...dataProjects!.data!
              .map((e) => CardProject(
                    name: e.name,
                    description: e.description,
                    state: e.state,
                    onTapDelete: () {
                      return true;
                    },
                  ))
              .toList(),

        // const CardProject(
        //   name: "Flutter app",
        //   description:
        //       "Hello! I'm [Your Name], a dedicated Flutter developer with a profound enthusiasm for crafting seamless and visually appealing mobile applications. My journey in the world of Flutter has equipped me with a versatile skill set, allowing me to bring ideas to life with elegant and efficient code.",
        //   state: "Pooching",
        // ),
        // const CardProject(),
        // const CardProject()
      ],
    );
  }
}
