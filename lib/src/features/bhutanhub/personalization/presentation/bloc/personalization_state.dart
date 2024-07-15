part of 'personalization_bloc.dart';

@immutable
abstract class PersonalizationState extends Equatable {
  const PersonalizationState();

  @override
  List<Object> get props => [];
}

class PersonalizationInitial extends PersonalizationState {
  const PersonalizationInitial();
}

// Product
class ProductCreationLoading extends PersonalizationState {}

class ProductCreationSuccess extends PersonalizationState {}

class ProductCreationFailed extends PersonalizationState {
  final String message;
  const ProductCreationFailed(this.message);

  @override
  List<String> get props => [message];
}

// Image
class ImageUploading extends PersonalizationState {}

class ImageUploadSuccess extends PersonalizationState {
  final List<String> imageUrl;
  const ImageUploadSuccess(this.imageUrl);

  @override
  List<List<String>> get props => [imageUrl];
}

class ImageUploadFailure extends PersonalizationState {
  final String message;
  const ImageUploadFailure(this.message);

  @override
  List<Object> get props => [message];
}
