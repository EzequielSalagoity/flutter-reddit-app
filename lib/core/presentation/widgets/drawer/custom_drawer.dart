import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/drawer/custom_drawer_item.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
          color: color_2),
      height: MediaQuery.of(context).size.height,
      width: 350,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.transparent,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 10),
                          SvgPicture.asset("assets/icons/close.svg",
                              color: color_9, width: 10, height: 10.7),
                          const SizedBox(width: 29)
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  padding: const EdgeInsets.all(0.75),
                  decoration: BoxDecoration(
                      color: color_3,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 1.5,
                            offset: const Offset(0, 0))
                      ],
                      shape: BoxShape.rectangle),
                  child: CircleAvatar(
                    backgroundColor: color_2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        "assets/icons/reddit_icon.svg",
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: color_8,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomDrawerItem(
                      icon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      title: "My profile"),
                  CustomDrawerItem(
                      icon: Icon(
                        Icons.folder_outlined,
                        size: 20,
                      ),
                      title: "Saved"),
                  CustomDrawerItem(
                      icon: Icon(
                        Icons.access_time,
                        size: 20,
                      ),
                      title: "History"),
                  CustomDrawerItem(
                      icon: Icon(
                        Icons.settings,
                        size: 20,
                      ),
                      title: "Settings"),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
