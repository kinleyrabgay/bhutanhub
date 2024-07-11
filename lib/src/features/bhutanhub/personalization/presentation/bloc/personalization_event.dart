part of 'personalization_bloc.dart';

@immutable
abstract class PersonalizationEvent extends Equatable {
  const PersonalizationEvent();
}

class CreateProductEvent extends PersonalizationEvent {
  const CreateProductEvent({
    required this.product,
  });

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}
