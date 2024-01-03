import 'package:flutter/material.dart';

import '../../../core/app_styles/app_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    required this.fun,
    super.key,
  });

  final String title;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 8),
          child: MaterialButton(
            onPressed: fun,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            color: AppColors.kComplementColor2.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
