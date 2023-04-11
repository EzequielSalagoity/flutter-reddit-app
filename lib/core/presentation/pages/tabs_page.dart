import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/core/presentation/bloc/ui_bloc/ui_bloc.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/bottom_nav_bar/custom_bottom_navbar.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/drawer/custom_drawer.dart';
import 'package:flutter_reddit_app/core/utils/ui_utils.dart';
import 'package:flutter_reddit_app/routes/router.gr.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        HomeRouter(),
        DiscoverRouter(),
        ChatRouter(),
        NotificationRouter(),
      ],
      homeIndex: 0,
      builder: (ctx, child, pageController) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: context.router.currentPath.contains('expandedPost')
                ? null
                : CustomAppBar(
                    selectedIndex: BlocProvider.of<UiBloc>(context).state.index,
                    scaffoldKey: _scaffoldKey,
                  ),
            drawer: const CustomDrawer(),
            drawerEnableOpenDragGesture: false,
            body: child,
            bottomNavigationBar:
                context.router.currentPath.contains('expandedPost')
                    ? null
                    : BlocBuilder<UiBloc, UiState>(
                        builder: (context, state) {
                          List<CustomBottomNavigationBarItem> items =
                              UIUtils.bottomNavigationItems();
                          items[3].notifications = 1;
                          items[3].hasNotifications = true;
                          return CustomNavBar(
                            selectedIndex: state.index,
                            items: items,
                            onTap: (value) {
                              if (state.index != value) {
                                BlocProvider.of<UiBloc>(context)
                                    .add(ChangeBottomNavbarIndex(value));
                                ctx.tabsRouter.setActiveIndex(value);
                                UIUtils.navigateTo(context, value);
                              }
                            },
                          );
                        },
                      ));
      },
    );
  }
}
