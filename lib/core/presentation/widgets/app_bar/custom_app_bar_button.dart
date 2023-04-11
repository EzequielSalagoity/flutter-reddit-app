import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarButton extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? imageColor;
  final double height;
  final double width;
  final EdgeInsets? padding;
  final bool border;

  const CustomAppBarButton({
    Key? key,
    required this.imagePath,
    this.onTap,
    this.backgroundColor,
    this.imageColor,
    required this.height,
    required this.width,
    this.border = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(100),
            border: border ? Border.all(width: 1, color: color_3) : null),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            color: imageColor ?? color_4,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
