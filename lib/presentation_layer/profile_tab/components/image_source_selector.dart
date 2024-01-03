import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles/app_theme.dart';

Future<bool?> selectImageSource(BuildContext context) async {
  bool userChose = false;
  bool fromGallery = false;
  await showModalBottomSheet(
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? AppColors.dInfoRowColor
        : Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "إختر مصدر الصورة",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.camera_fill,
                        size: 35,
                        color: AppColors.kComplementColor2,
                      ),
                      onPressed: () {
                        userChose = true;
                        // fromGallery=false; already false
                        Navigator.pop(context);
                      }),
                ),
                Text(
                  "الكاميرا",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  icon: const Icon(
                    CupertinoIcons.photo_fill_on_rectangle_fill,
                    size: 35,
                    color: AppColors.kComplementColor2,
                  ),
                  onPressed: () {
                    userChose = true;
                    fromGallery = true;
                    Navigator.pop(context);
                  }),
              Text(
                "المعرض",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ]),
          ],
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
  if (!userChose) return null;
  return fromGallery;
}
