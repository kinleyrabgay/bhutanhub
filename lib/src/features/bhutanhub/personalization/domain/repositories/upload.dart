import 'package:bhutanhub/core/utils/typedef.dart';

abstract class UploadRepository {
  const UploadRepository();

  ResultFuture<List<String>> uploadProductImages();
}
