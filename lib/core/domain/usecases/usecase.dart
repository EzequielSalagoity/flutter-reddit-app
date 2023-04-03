import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class VoidReturn extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
