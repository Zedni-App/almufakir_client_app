import 'package:flutter/material.dart';

class BuildOption extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onPressed;

  const BuildOption({
    required this.title,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  TextButton build(BuildContext context) => TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 14,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            icon,
          ],
        ),
      );
}
