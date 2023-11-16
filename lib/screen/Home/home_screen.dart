import 'package:flutter/material.dart';
import 'package:testapp_aoi/models/userModels/about_model.dart';
import 'package:testapp_aoi/repository/user_method_networking.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CustomSegmentedController<int>? controller =
      CustomSegmentedController(value: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                widget: FutureBuilder<UserAboutModel?>(
                    future:
                        UserMethodNetworking().getAboutMethod(context: context),
                    builder:
                        (context, AsyncSnapshot<UserAboutModel?> snapshot) {
                      if (snapshot.hasData) {
                        return AboutPartWidget(
                          about: snapshot.data!.data!.about ?? '----',
                          email: snapshot.data!.data!.email ?? '----',
                          phone: snapshot.data!.data!.phone ?? '----',
                          location: snapshot.data!.data!.location ?? '----',
                          birthday: snapshot.data!.data!.birthday ?? '----',
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    })),
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
