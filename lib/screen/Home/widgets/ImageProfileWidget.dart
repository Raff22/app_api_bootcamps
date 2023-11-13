import 'package:flutter/material.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testapp_aoi/utils/method_widget/showBottomSheetCamera.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({
    super.key,
    required this.urlImage,
    this.onTap,
  });

  final String urlImage;
  final Function(String?)? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          final ImagePicker picker = ImagePicker();
          showBottomSheetCamera(
            context: context,
            onTapGallery: () async {
              persistentBottomSheetController?.close();

              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image!.path.isNotEmpty) {
                if (onTap != null) {
                  onTap!(image.path);
                }
              }
            },
            onTapCamera: () async {
              persistentBottomSheetController?.close();

              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              if (image!.path.isNotEmpty) {
                print(image.path);
                if (onTap != null) {
                  onTap!(image.path);
                }
              }
            },
          );
        },
        child: Container(
            width: context.getWidth(divide: 4),
            height: context.getWidth(divide: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: kElevationToShadow[4]),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    );
                  },
                  fit: BoxFit.cover,
                  urlImage,
                  height: context.getWidth(divide: 4),
                  width: context.getWidth(divide: 4),
                ),
              ),
            )),
      ),
    );
  }
}
