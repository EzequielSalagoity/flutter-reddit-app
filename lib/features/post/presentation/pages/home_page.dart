import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/bloc/ui_bloc/ui_bloc.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_reddit_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/features/post/presentation/widgets/card/post_card.dart';
import 'package:flutter_reddit_app/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UiBloc uiBloc = context.read<UiBloc>();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is Loaded) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (BuildContext context, int index) {
                          Post post = state.posts.posts[index];
                          return PostCard(
                            post: post,
                            onTap: () async {
                              uiBloc.add(const ChangePostExpandedEvent(true));
                              await context.router
                                  .navigate(TabsScaffoldRouter(children: [
                                HomeRouter(children: [
                                  ExpandedPostCardRouter(post: post)
                                ])
                              ]));
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: state.posts.length,
                      ),
                    )
                  ],
                );
              }
              if (state is Loading) {}
              if (state is Empty || state is Error) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Oops!\nThere's no posts yet.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => BlocProvider.of<PostBloc>(context)
                            .add(GetPostsEvent()),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: color_3),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4),
                                    color: color_7.withOpacity(0.92))
                              ]),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: const Text('Refresh'),
                        ),
                      )
                    ],
                  ),
                );
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
