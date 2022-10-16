import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard(
      {Key? key,
      @required this.title,
      @required this.image,
      @required this.screen,
      @required this.onPress,
     @required this.width ,
        @required this.height})
      : super(key: key);
  late String? title;
  late String? image;
  late var screen;
  late VoidCallback? onPress;
  late double? width;
  late double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Image.network(
              image.toString(),
              width: width, //screen.width * 0.3,
              height: height, // screen.height * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              title.toString(),
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
