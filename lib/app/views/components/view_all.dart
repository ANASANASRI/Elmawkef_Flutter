import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  ViewAll(
      {@required this.title,
      @required this.buttonTitle,
      @required this.onPressed,
      Key? key})
      : super(key: key);
  late final String? title;
  late final String? buttonTitle;
  late final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle.toString(),
            ))
      ],
    );
  }
}
