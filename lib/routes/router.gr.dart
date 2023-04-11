// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i10;

import '../core/presentation/pages/splash_page.dart' as _i1;
import '../core/presentation/pages/tabs_page.dart' as _i2;
import '../features/post/domain/entities/post.dart' as _i11;
import '../features/post/presentation/pages/chat_page.dart' as _i7;
import '../features/post/presentation/pages/discover_page.dart' as _i6;
import '../features/post/presentation/pages/expanded_post_page.dart' as _i5;
import '../features/post/presentation/pages/home_page.dart' as _i4;
import '../features/post/presentation/pages/notification_page.dart' as _i8;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        maintainState: false,
        transitionsBuilder: _i9.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabsScaffoldRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.TabsPage(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        transitionsBuilder: _i9.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DiscoverRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        transitionsBuilder: _i9.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        transitionsBuilder: _i9.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NotificationRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    ExpandedPostCardRouter.name: (routeData) {
      final args = routeData.argsAs<ExpandedPostCardRouterArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ExpandedPostCard(
          key: args.key,
          post: args.post,
        ),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.DiscoverPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ChatPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.NotificationPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRouter.name,
          path: '/splash',
        ),
        _i9.RouteConfig(
          TabsScaffoldRouter.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              '#redirect',
              path: '',
              parent: TabsScaffoldRouter.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i9.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: TabsScaffoldRouter.name,
              children: [
                _i9.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i9.RouteConfig(
                  ExpandedPostCardRouter.name,
                  path: 'expandedPost',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              DiscoverRouter.name,
              path: 'discover',
              parent: TabsScaffoldRouter.name,
              children: [
                _i9.RouteConfig(
                  DiscoverRoute.name,
                  path: '',
                  parent: DiscoverRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              ChatRouter.name,
              path: 'chat',
              parent: TabsScaffoldRouter.name,
              children: [
                _i9.RouteConfig(
                  ChatRoute.name,
                  path: '',
                  parent: ChatRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              NotificationRouter.name,
              path: 'notification',
              parent: TabsScaffoldRouter.name,
              children: [
                _i9.RouteConfig(
                  NotificationRoute.name,
                  path: '',
                  parent: NotificationRouter.name,
                )
              ],
            ),
          ],
        ),
        _i9.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/splash',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRouter extends _i9.PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/splash',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.TabsPage]
class TabsScaffoldRouter extends _i9.PageRouteInfo<void> {
  const TabsScaffoldRouter({List<_i9.PageRouteInfo>? children})
      : super(
          TabsScaffoldRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabsScaffoldRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class DiscoverRouter extends _i9.PageRouteInfo<void> {
  const DiscoverRouter({List<_i9.PageRouteInfo>? children})
      : super(
          DiscoverRouter.name,
          path: 'discover',
          initialChildren: children,
        );

  static const String name = 'DiscoverRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ChatRouter extends _i9.PageRouteInfo<void> {
  const ChatRouter({List<_i9.PageRouteInfo>? children})
      : super(
          ChatRouter.name,
          path: 'chat',
          initialChildren: children,
        );

  static const String name = 'ChatRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class NotificationRouter extends _i9.PageRouteInfo<void> {
  const NotificationRouter({List<_i9.PageRouteInfo>? children})
      : super(
          NotificationRouter.name,
          path: 'notification',
          initialChildren: children,
        );

  static const String name = 'NotificationRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ExpandedPostCard]
class ExpandedPostCardRouter
    extends _i9.PageRouteInfo<ExpandedPostCardRouterArgs> {
  ExpandedPostCardRouter({
    _i10.Key? key,
    required _i11.Post post,
  }) : super(
          ExpandedPostCardRouter.name,
          path: 'expandedPost',
          args: ExpandedPostCardRouterArgs(
            key: key,
            post: post,
          ),
        );

  static const String name = 'ExpandedPostCardRouter';
}

class ExpandedPostCardRouterArgs {
  const ExpandedPostCardRouterArgs({
    this.key,
    required this.post,
  });

  final _i10.Key? key;

  final _i11.Post post;

  @override
  String toString() {
    return 'ExpandedPostCardRouterArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i6.DiscoverPage]
class DiscoverRoute extends _i9.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: '',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i7.ChatPage]
class ChatRoute extends _i9.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: '',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i8.NotificationPage]
class NotificationRoute extends _i9.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '',
        );

  static const String name = 'NotificationRoute';
}
