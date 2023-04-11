import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/bottom_nav_bar/custom_bottom_navbar.dart';
import 'package:flutter_reddit_app/routes/router.gr.dart';

class UIUtils {
  static List<CustomBottomNavigationBarItem> bottomNavigationItems() {
    return [
      CustomBottomNavigationBarItem(
        text: "Home",
          activeIcon: const Icon(
            Icons.home,
            size: 25,
          ),
          inactiveIcon: const Icon(
            Icons.home_outlined,
            size: 25,
            color: color_5,
          )),
      CustomBottomNavigationBarItem(
        text: "Discover",
          activeIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          inactiveIcon: const Icon(
            Icons.search,
            size: 25,
            color: color_5,
          )),
      CustomBottomNavigationBarItem(
        text: "Chat",
          activeIcon: const Icon(
            Icons.message_outlined,
            size: 25,
          ),
          inactiveIcon: const Icon(
            Icons.message_outlined,
            size: 25,
            color: color_5,
          )),
      CustomBottomNavigationBarItem(
        text: "Inbox",
        hasNotifications: true,
          activeIcon: const Icon(
            Icons.notifications,
            size: 25,
          ),
          inactiveIcon: const Icon(
            Icons.notifications_none,
            size: 25,
            color: color_5,
          )),
      
    ];
  }

  static void navigateTo(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await context.router.navigate(const TabsScaffoldRouter(children: [HomeRouter()]));
        break;
      case 1:
        await context.router.navigate(const TabsScaffoldRouter(children: [DiscoverRouter()]));
        break;
      case 2:
        await context.router.navigate(const TabsScaffoldRouter(children: [ChatRouter()]));
        break;
      case 3:
        await context.router.navigate(const TabsScaffoldRouter(children: [NotificationRouter()]));
        break;
      default:
        await context.router.navigate(const TabsScaffoldRouter(children: [HomeRouter()]));
        break;
    }
  }
}
