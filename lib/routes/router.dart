import 'package:auto_route/auto_route.dart';
import 'package:flutter_reddit_app/core/presentation/pages/splash_page.dart';
import 'package:flutter_reddit_app/core/presentation/pages/tabs_page.dart';
import 'package:flutter_reddit_app/features/post/presentation/pages/chat_page.dart';
import 'package:flutter_reddit_app/features/post/presentation/pages/discover_page.dart';
import 'package:flutter_reddit_app/features/post/presentation/pages/expanded_post_page.dart';
import 'package:flutter_reddit_app/features/post/presentation/pages/home_page.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter_reddit_app/features/post/presentation/pages/notification_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/splash',
      name: "SplashRouter",
      page: SplashPage,
      initial: true,
      maintainState: false,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
        path: '/',
        name: "TabsScaffoldRouter",
        page: TabsPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        children: [
          // Indice 0, Home
          CustomRoute(
            initial: true,
            path: 'home',
            name: 'HomeRouter',
            transitionsBuilder: TransitionsBuilders.noTransition,
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: HomePage,
              ),
              AutoRoute(
                path: 'expandedPost',
                name: "ExpandedPostCardRouter",
                page: ExpandedPostCard,
              ),
            ],
          ),
          // Indice 1, Discover
          CustomRoute(
            path: 'discover',
            name: 'DiscoverRouter',
            transitionsBuilder: TransitionsBuilders.noTransition,
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: DiscoverPage,
              ),
            ],
          ),
          // Indice 2, Chat
          CustomRoute(
              path: 'chat',
              name: 'ChatRouter',
              transitionsBuilder: TransitionsBuilders.noTransition,
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: '',
                  page: ChatPage,
                ),
              ]),
          // Indice 3, Notifications
          AutoRoute(
              path: 'notification',
              name: 'NotificationRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: '',
                  page: NotificationPage,
                ),
              ]),
        ]),
    RedirectRoute(path: '*', redirectTo: '/splash'),
  ],
)
class $AppRouter {}
