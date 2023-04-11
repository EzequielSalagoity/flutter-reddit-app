import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';

class PostCardOptionButton extends StatelessWidget {
  final String value;
  final IconData icon;

  const PostCardOptionButton(
      {super.key, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.topRight,
          color: Theme.of(context).backgroundColor,
          child: Center(
              child: Icon(
            icon,
            color: color_5,
            size: 20,
          )),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(value, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color_5),)
      ],
    );
  }
}
