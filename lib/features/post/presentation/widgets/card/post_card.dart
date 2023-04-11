import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';
import 'package:flutter_reddit_app/core/utils/time_utils.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_reddit_app/features/post/presentation/widgets/card/post_card_option_button.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function()? onTap;

  const PostCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(4, 4),
                  color: color_7.withOpacity(0.92))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "u/${post.author} • ${TimeUtils.calculateHours(post.dateOfCreation)}h",
                            style: Theme.of(context).textTheme.headlineSmall,
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
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            post.title,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
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
                      )
                    ],
                  ),
                ),
                if (post.thumbnailImage.trim().isNotEmpty &&
                    post.thumbnailImage.trim() != "nsfw")
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          post.thumbnailImage,
                          height: 70,
                          width: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Placeholder(fallbackHeight: 70, fallbackWidth: 90,),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
