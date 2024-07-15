import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/repositories/upload.dart';

class Upload extends UsecaseWithoutParam<void> {
  final UploadRepository _repo;

  const Upload(this._repo);

  @override
  ResultFuture<List<String>> call() => _repo.uploadProductImages();
}
