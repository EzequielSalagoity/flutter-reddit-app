import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/core/presentation/bloc/ui_bloc/ui_bloc.dart';
import 'package:flutter_reddit_app/core/theme/app_themes.dart';
import 'package:flutter_reddit_app/dependency_injection.dart' as dependency_injector;
import 'package:flutter_reddit_app/routes/router.gr.dart';
import 'features/post/presentation/bloc/post_bloc.dart';

void main() {
  dependency_injector.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reddit clone',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: customLightTheme(),
      routerDelegate: appRouter.delegate(initialRoutes: [
         const SplashRouter()
      ]),
      routeInformationParser: appRouter.defaultRouteParser(),
      builder: (ctx, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  dependency_injector.dependencyInjector<PostBloc>(),
            ),
            BlocProvider(
              create: (context) => UiBloc(),
            ),
          ],
          child: child ?? Container(),
        );
      },
    );
  }
}
