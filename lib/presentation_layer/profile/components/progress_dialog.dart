import 'package:flutter/material.dart';

const _defaultDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

class ProgressDialog extends StatelessWidget {
  final BoxDecoration decoration;
  final double opacity;
  final String? message;

  const ProgressDialog({
    super.key,
    this.decoration = _defaultDecoration,
    this.opacity = 1.0,
    this.message,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Opacity(
          opacity: opacity,
          child: message == null
              ? Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: decoration,
                    child: const CircularProgressIndicator(),
                  ),
                )
              : Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  decoration: decoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CircularProgressIndicator(),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Text(message!),
                      ),
                    ],
                  ),
                ),
        ),
      );
}
