import 'package:cinemix_ui/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef VoidFuture = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
