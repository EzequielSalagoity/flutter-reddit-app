import 'package:flutter/material.dart';
import '../../../constants/ui_values.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Widget icon;

  const CustomDrawerItem({super.key, required this.title, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 15.5),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 11),
            Text(title, 
            style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: color_9)
            ),
          ],
        ),
      ),
    );
  }
}