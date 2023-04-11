import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/app_bar/custom_app_bar_button.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarPostExpanded extends StatelessWidget
    implements PreferredSizeWidget {
  final Function()? onBack;
  const CustomAppBarPostExpanded({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.only(top: 11, bottom: 11, left: 0, right: 18),
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: [
        BoxShadow(
            color: color_6.withOpacity(0.15),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2))]),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBarButton(
                onTap: onBack,
                imagePath: "assets/icons/app_bar/back.svg",
                height: 18,
                width: 8,
                border: false,
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
