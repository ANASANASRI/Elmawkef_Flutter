import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category(
      {Key? key,
      @required this.color,
      @required this.icon,
      @required this.name,
      @required this.onClick})
      : super(key: key);

  late final Color? color;
  late final Icon? icon;
  late final String? name;
  late final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: icon,
            constraints: const BoxConstraints(
              minWidth: 52,
              minHeight: 52,
              maxHeight: 64,
              maxWidth: 64,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name.toString(),
          ),
        ],
      ),
    );
  }
}
