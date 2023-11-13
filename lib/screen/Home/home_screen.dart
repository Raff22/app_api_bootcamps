import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/part_screen/projects_part.dart';
import 'package:testapp_aoi/screen/Home/part_screen/about_part.dart';
import 'package:testapp_aoi/screen/Home/part_screen/education_part.dart';
import 'package:testapp_aoi/screen/Home/part_screen/skills_part.dart';
import 'package:testapp_aoi/screen/Home/part_screen/social_media_part.dart';
import 'package:testapp_aoi/screen/Home/widgets/ImageProfileWidget.dart';
import 'package:testapp_aoi/screen/Home/widgets/SegmentTypeWidget.dart';
import 'package:testapp_aoi/screen/Home/widgets/UserIDAndNameWidget.dart';
import 'package:testapp_aoi/utils/Layaout.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:testapp_aoi/utils/method_widget/showBottomSheetCamera.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  CustomSegmentedController<int>? controller =
      CustomSegmentedController(value: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        persistentBottomSheetController?.close();
      },
      child: Scaffold(
          body: ListView(children: [
        ImageProfileWidget(
          onTap: (pathImage) {
            print("here path : $pathImage");
          },
          urlImage:
              'https://mzkjuyrvwxulswwriorm.supabase.co/storage/v1/object/public/profile/profile/100224.png',
        ),
        layoutH8,
        const UserIDAndNameWidget(
          nameUser: "Fahad Alazmi",
          idUser: "1546584",
          position: "Flutter developer",
        ),
        layoutH8,
        SegmentTypeWidget(
          controller: controller,
          widgetWidget: [
            SegmentModel(
                id: 0,
                title: const Text("About"),
                widget: const AboutPartWidget(
                  about:
                      "Hello! I'm [Your Name], a dedicated Flutter developer with a profound enthusiasm for crafting seamless and visually appealing mobile applications. My journey in the world of Flutter has equipped me with a versatile skill set, allowing me to bring ideas to life with elegant and efficient code.",
                  email: "fahad@gmail.com",
                  phone: "0501231240",
                  location: "dmamm",
                  birthday: "10/10/1994",
                )),
            SegmentModel(
                id: 1,
                title: const Text("Education"),
                widget: const EducationPartWidget()),
            SegmentModel(
                id: 2,
                title: const Text("Projects"),
                widget: const ProjectsPart()),
            SegmentModel(
                id: 3,
                title: const Text("Skills"),
                widget: const SkillsPartWidget()),
            SegmentModel(
                id: 4,
                title: const Text("Social Media"),
                widget: const SocialMediaPartWidget())
          ],
        )
      ])),
    );
  }
}

///
///
///
///

///
///
///
///
///
//

///
///
///
///
///
///