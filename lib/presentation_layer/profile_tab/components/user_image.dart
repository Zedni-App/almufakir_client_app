import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/app_theme.dart';
import '../../../core/app_user.dart';
import '../../../core/assets.dart';
import '../../../core/enums.dart';
import '../controller/profile_bloc.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: percentWidth(0.4),
      height: percentHeight(0.3),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: AppColors.kPrimaryColor),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
          )
        ],
        shape: BoxShape.circle,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (_, c) => c is UpdateUserImageState,
        builder: (context, state) {
          if (state is UpdateUserImageState) {
            if (state.processState == ProcessState.processing) {
              return const Center(child: CircularProgressIndicator());
            }
          }
          return FittedBox(
            child: CachedNetworkImage(
              imageUrl: appUser.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => defaultImage(),
            ),
          );
        },
      ),
    );
  }

  Widget defaultImage() {
    return Image.asset(
      AppAssets.logo,
      fit: BoxFit.cover,
    );
  }
}
