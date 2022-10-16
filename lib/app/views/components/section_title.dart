import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {Key? key, required this.text, this.alignment = MainAxisAlignment.center})
      : super(key: key);
  final String text;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          VerticalDivider(
            color: ThemeData.light().colorScheme.secondary,
            thickness: 3.5,
            width: 16,
            indent: 3,
            endIndent: 3,
          ),
          Text(
            text.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
