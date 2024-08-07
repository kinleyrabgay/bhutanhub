part of 'personalization_bloc.dart';

@immutable
abstract class PersonalizationEvent extends Equatable {
  const PersonalizationEvent();
}

class FetchProducts extends PersonalizationEvent {
  const FetchProducts({required this.uid});

  final String uid;

  @override
  List<Object?> get props => [uid];
}

class CreateProductEvent extends PersonalizationEvent {
  const CreateProductEvent({
    required this.product,
  });

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}

class UpdateProductEvent extends PersonalizationEvent {
  const UpdateProductEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}

class DeleteProductEvent extends PersonalizationEvent {
  const DeleteProductEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}

class UploadImageEvent extends PersonalizationEvent {
  @override
  List<Object?> get props => [];
}
