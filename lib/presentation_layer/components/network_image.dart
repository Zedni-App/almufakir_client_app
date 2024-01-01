import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/assets.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.placeHolder,
    this.defaultImage,
  });
  final String imageUrl;
  final String? placeHolder;
  final String? defaultImage;
  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (_, image) => Image(
        image: image,
        fit: BoxFit.cover,
      ),
      errorWidget: (_, __, ___) => defaultPic(),
    );
  }

  Widget defaultPic() {
    if (defaultImage == null) {
      return Image.asset(
        AppAssets.logo,
        fit: BoxFit.cover,
      );
    }
    if (defaultImage!.split(".").last == "svg") {
      return SvgPicture.asset(
        defaultImage!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
    return Image.asset(
      defaultImage!,
      fit: BoxFit.cover,
    );
  }
}
