import 'package:bhutan_hub/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

// T
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = Future<Either<Failure, void>>;
typedef DataMap = Map<String, dynamic>;