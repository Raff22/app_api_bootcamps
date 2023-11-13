import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardEducation.dart';
import 'package:testapp_aoi/screen/Home/widgets/CardSkill.dart';
import 'package:testapp_aoi/screen/edit/edit_social_media_screen%20copy.dart';
import 'package:testapp_aoi/utils/Layaout.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/method_widget/showDeleteDialog.dart';

class SocialMediaPartWidget extends StatelessWidget {
  const SocialMediaPartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                   context.push(view: AddSocialMediaScreen());
                }, icon: const Icon(Icons.add_circle_outlined))),
        const CardSocialMedia(
          social: 'snapchat',
        ),
        const CardSocialMedia(
          social: 'tiktok',
        )
      ],
    );
  }
}

class CardSocialMedia extends StatelessWidget {
  const CardSocialMedia(
      {super.key, this.social = "other", this.username = "-----"});

  final String social;
  final String username;

  @override
  Widget build(BuildContext context) {
    String IconPath = "";
    switch (social.toLowerCase()) {
      case "twitter":
        IconPath = "assets/twitter.png";
      case "snapchat":
        IconPath = "assets/snapchat.png";
      case "instagram":
        IconPath = "assets/instagram.png";
      case "tiktok":
        IconPath = "assets/tik-tok.png";
      case "telegram":
        IconPath = "assets/snapchat.png";
      case "facebook":
        IconPath = "assets/facebook.png";
      case "youtube":
        IconPath = "assets/snapchat.png";
      case "whatsapp":
        IconPath = "assets/snapchat.png";
      default:
        IconPath = "assets/other.png";
    }
    return Container(
      width: context.getWidth() - 100,
      margin: const EdgeInsets.only(top: 15),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Padding(
              padding:
                  EdgeInsets.all(social.toLowerCase() != "other" ? 0.0 : 8.0),
              child: Image.asset(
                IconPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          layoutW24,
          const Text("data")
        ],
      ),
    );
  }
}
