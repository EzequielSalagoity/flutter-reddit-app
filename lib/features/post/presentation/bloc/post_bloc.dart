import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/core/domain/usecases/usecase.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_reddit_app/features/post/domain/usecases/get_posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostsGetter postsGetter;

  PostBloc({required this.postsGetter}) : super(Empty()) {
    on<PostEvent>((event, emit) async {
      if (event is GetPostsEvent) await onGetPostsEvent(event, emit);
    });
  }

  Future<void> onGetPostsEvent(
      GetPostsEvent event, Emitter<PostState> emit) async {
    emit(Loading());
    final postsOrFailure = await postsGetter(NoParams());
    postsOrFailure.fold((failure) => emit(Error(_mapFailureToMessage(failure))),
        (posts) => emit(Loaded(posts)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server failure";
      case NoInternetFailure:
        return "No internet failure";
      default:
        return 'Unexpected error';
    }
  }
}
