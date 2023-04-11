import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/presentation/bloc/ui_bloc/ui_bloc.dart';
import 'package:flutter_reddit_app/core/presentation/widgets/app_bar/custom_app_bar_post_expanded.dart';
import 'package:flutter_reddit_app/core/utils/time_utils.dart';
import 'package:flutter_reddit_app/features/post/presentation/widgets/card/post_card_option_button.dart';

import '../../domain/entities/post.dart';

class ExpandedPostCard extends StatelessWidget {
  final Post post;

  const ExpandedPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    UiBloc uiBloc = context.read<UiBloc>();

    Widget? image;

    try {
      image = Image.network(
        post.thumbnailImage,
        fit: BoxFit.fitWidth,
        filterQuality: FilterQuality.high,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const CircularProgressIndicator();
        },
      );
    } catch (e) {}

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBarPostExpanded(
              onBack: () {
                if (uiBloc.state.isPostExpanded) {
                  uiBloc.add(const ChangePostExpandedEvent(false));
                }
                context.router.navigateBack();
              },
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "u/${post.author} • ${TimeUtils.calculateHours(post.dateOfCreation)}h",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 13,
                                  // color: color_9
                                ),
                          )),
                          Container(
                            height: 20,
                            width: 40,
                            alignment: Alignment.topRight,
                            color: Theme.of(context).backgroundColor,
                            child: const Center(
                                child: Icon(
                              Icons.more_vert,
                              size: 15,
                            )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            post.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 16, color: color_9),
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (post.url.trim().isNotEmpty &&
                        post.url.trim() != "nsfw" &&
                        !post.url.trim().contains('gallery')) ...[
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Theme.of(context).backgroundColor,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                post.url,
                                fit: BoxFit.fitWidth,
                                filterQuality: FilterQuality.high,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Center(
                                      child: Text(
                                        'Oops!\nSomething went wrong. Please try again.',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: const Center(
                                      child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator()),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PostCardOptionButton(
                            icon: Icons.favorite_border,
                            value: post.score.toString()),
                        PostCardOptionButton(
                            icon: Icons.messenger_outline_sharp,
                            value: post.comments.toString()),
                        const PostCardOptionButton(
                            icon: Icons.share, value: "Share"),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
