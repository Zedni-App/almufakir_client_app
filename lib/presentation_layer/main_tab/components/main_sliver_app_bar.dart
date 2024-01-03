import 'package:flutter/material.dart';

import '../../../core/app_styles/size_config.dart';
import '../../../core/app_styles/app_theme.dart';
import 'main_header.dart';

class MainSliverAppBar extends StatefulWidget {
  const MainSliverAppBar({super.key, required this.scrollCtrl});
  final ScrollController scrollCtrl;
  @override
  State<MainSliverAppBar> createState() => _MainSliverAppBarState();
}

class _MainSliverAppBarState extends State<MainSliverAppBar> {
  @override
  void initState() {
    widget.scrollCtrl.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollCtrl.removeListener(() {});
    super.dispose();
  }

  bool isExpanded(double expandedHeight) {
  
    return widget.scrollCtrl.hasClients &&
        widget.scrollCtrl.offset < expandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final expandedHeight = percentHeight(0.27);
    return SliverAppBar(
      flexibleSpace: isExpanded(expandedHeight)
          ? const FlexibleSpaceBar(
              background: ExpandedAppBar(),
              collapseMode: CollapseMode.none,
            )
          : null,
      pinned: true,
      floating: true,
      expandedHeight: expandedHeight,
      title: isExpanded(expandedHeight) ? null : const Text("الشاشة الرئيسية"),
    );
  }
}

class ExpandedAppBar extends StatelessWidget {
  const ExpandedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: percentHeight(0.03),
          color: AppColors.kPrimaryColor.withOpacity(0.7),
        ),
        MainHeader(height: percentHeight(0.2)),
        Container(
          width: double.infinity,
          height: percentHeight(0.04),
          color: AppColors.kPrimaryColor.withOpacity(0.7),
        ),
      ],
    );
  }
}
