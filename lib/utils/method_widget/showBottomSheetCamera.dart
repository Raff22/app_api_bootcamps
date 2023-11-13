
import 'package:flutter/material.dart';
import 'package:testapp_aoi/utils/Layaout.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';

PersistentBottomSheetController? persistentBottomSheetController;

showBottomSheetCamera(
    {required BuildContext context,
    Function()? onTapCamera,
    Function()? onTapGallery}) {
  persistentBottomSheetController =
      Scaffold.of(context).showBottomSheet((context) => Container(
            height: 200,
            width: context.getWidth(),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onTapCamera,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.camera), layoutW16, Text("Camera")],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTapGallery,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_rounded),
                        layoutW16,
                        Text("Gallery")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}
