import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/app_bar/custom_app_bar_button.dart';
import 'package:flutter_reddit_app/flavors.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int selectedIndex;

  const CustomAppBar(
      {super.key, required this.scaffoldKey, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
      decoration:
          BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: [
        BoxShadow(
            color: color_6.withOpacity(0.15),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2))
      ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBarButton(
              onTap: () async {
                scaffoldKey.currentState?.openDrawer();
              },
              imagePath: "assets/icons/app_bar/drawer.svg",
              height: 13.5,
              width: 18,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(F.title, style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
