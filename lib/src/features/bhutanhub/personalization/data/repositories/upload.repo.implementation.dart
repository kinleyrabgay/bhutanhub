import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/failure.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/data/datsources/upload.remote.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/repositories/upload.dart';
import 'package:dartz/dartz.dart';

class UploadRepositoryImplementation implements UploadRepository {
  const UploadRepositoryImplementation({required this.uploadRemoteDataSource});

  final UploadRemoteDataSource uploadRemoteDataSource;

  @override
  ResultFuture<List<String>> uploadProductImages() async {
    try {
      final response = await uploadRemoteDataSource.uploadProductImages();
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
