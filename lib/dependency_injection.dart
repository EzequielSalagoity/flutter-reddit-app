import 'package:flutter_reddit_app/core/domain/network/network_info.dart';
import 'package:flutter_reddit_app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_reddit_app/features/post/data/repositories/post_repository_impl.dart';
import 'package:flutter_reddit_app/features/post/domain/repositories/post_repository.dart';
import 'package:flutter_reddit_app/features/post/domain/usecases/get_posts.dart';
import 'package:flutter_reddit_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final dependencyInjector = GetIt.instance;

void init() {
  //! Features - Post
  // Bloc
  dependencyInjector
      .registerFactory(() => PostBloc(postsGetter: dependencyInjector()));

  // Use cases
  dependencyInjector
      .registerLazySingleton(() => PostsGetter(dependencyInjector()));

  // Repositories
  dependencyInjector.registerLazySingleton<PostRepository>(() =>
      PostRepositoryImpl(
          remoteDataSource: dependencyInjector(),
          networkInfo: dependencyInjector()));
  
  // Data sources
  dependencyInjector.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: dependencyInjector()));

  //! Core
  dependencyInjector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dependencyInjector()));

  //! External
  dependencyInjector.registerLazySingleton(() => http.Client());
  dependencyInjector.registerLazySingleton(() => InternetConnectionChecker());

}
