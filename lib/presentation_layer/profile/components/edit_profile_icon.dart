import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/theme.dart';
import '../controller/profile_bloc.dart';

class EditImageIcon extends StatelessWidget {
  const EditImageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await _selectImageSource(context);
        if (res == null) return; //no select
        if (context.mounted) {
          context.read<ProfileBloc>().add(PickImage(fromGallery: res));
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kComplementColor2,
        ),
        child: const Icon(
          CupertinoIcons.pen,
          size: 30,
        ),
      ),
    );
  }

  Future<bool?> _selectImageSource(BuildContext context) async {
    bool userChose = false;
    bool fromGallery = false;
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) => SizedBox(
        height: percentHeight(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 2),
                  child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.camera_fill,
                        size: 35,
                        color: kComplementColor2,
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
                )
              ],
            ),
            Column(children: [
              IconButton(
                  icon: const Icon(
                    CupertinoIcons.photo_fill_on_rectangle_fill,
                    size: 35,
                    color: kComplementColor2,
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
      ),
    );
    if (!userChose) return null;
    return fromGallery;
  }
}
