import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/core/presentation/bloc/ui_bloc/ui_bloc.dart';
import 'package:flutter_reddit_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_reddit_app/routes/router.gr.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    UiBloc uiBloc = context.read<UiBloc>();
    PostBloc postBloc = context.read<PostBloc>();

    // Fetch posts
    Future.delayed(Duration(milliseconds: 2000));
    postBloc.add(GetPostsEvent());
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   context.router.removeLast();
    //       await context.router.navigate(const TabsScaffoldRouter(children: [HomeRouter()]));
    //       uiBloc.add(const ChangeBottomNavbarIndex(0));
    // });
    
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) async {
        if(state is Loaded || state is Error) {
          context.router.removeLast();
          await context.router.navigate(const TabsScaffoldRouter(children: [HomeRouter()]));
          uiBloc.add(const ChangeBottomNavbarIndex(0));
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Center(
            child: SvgPicture.asset(
          "assets/icons/reddit_icon.svg",
          height: 50,
        )),
      ),
    );
  }
}
