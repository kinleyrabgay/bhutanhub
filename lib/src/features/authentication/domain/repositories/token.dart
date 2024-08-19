import 'package:bhutanhub/core/utils/typedef.dart';

abstract class TokenRepository {
  ResultFuture<void> saveToken(String token);
  ResultFuture<String?> getToken();
  ResultFuture<void> deleteToken();
}
